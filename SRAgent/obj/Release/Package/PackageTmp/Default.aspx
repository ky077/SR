<%--<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SRAgent._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>ASP.NET</h1>
        <p class="lead">ASP.NET is a free web framework for building great Web sites and Web applications using HTML, CSS, and JavaScript.</p>
        <p><a href="http://www.asp.net" class="btn btn-primary btn-lg">Learn more &raquo;</a></p>
    </div>

    <div class="row">
        <div class="col-md-4">
            <h2>Getting started</h2>
            <p>
                ASP.NET Web Forms lets you build dynamic websites using a familiar drag-and-drop, event-driven model.
            A design surface and hundreds of controls and components let you rapidly build sophisticated, powerful UI-driven sites with data access.
            </p>
            <p>
                <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301948">Learn more &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Get more libraries</h2>
            <p>
                NuGet is a free Visual Studio extension that makes it easy to add, remove, and update libraries and tools in Visual Studio projects.
            </p>
            <p>
                <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301949">Learn more &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Web Hosting</h2>
            <p>
                You can easily find a web hosting company that offers the right mix of features and price for your applications.
            </p>
            <p>
                <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301950">Learn more &raquo;</a>
            </p>
        </div>
    </div>

</asp:Content>--%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Voice Chatbot</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
    <h2>Voice Chatbot</h2>
    <button id="recordButton" data-recording="false">Start Recording</button>
    <div id="chatHistory"></div>
    <audio id="responseAudio"></audio>

    <script>
        $(document).ready(function () {
            let sessionId = null;
            let mediaRecorder;
            let audioChunks = [];

            async function getSessionId() {
                let formData = new FormData();
                formData.append("topicId", 0);
                formData.append("chatId", 0);
                formData.append("action", "getChatSessionId");

                try {
                    let response = await fetch("VoiceChatHandler.ashx", {
                        method: "POST",
                        body: formData
                    });

                    if (!response.ok) throw new Error("Failed to get session ID");

                    let data = await response.json();
                    sessionId = data.sessionId;
                } catch (error) {
                    console.error("Error fetching session ID:", error);
                }
            }

            async function sendAudio(audioBlob) {
                if (sessionId == null) {
                    await getSessionId();
                    if (!sessionId) {
                        alert("Failed to retrieve session ID.");
                        return;
                    }
                }

                let formData = new FormData();
                formData.append("audioFile", audioBlob, "recording.webm");
                formData.append("action", "getTranscription");

                try {
                    let response = await fetch("VoiceChatHandler.ashx", {
                        method: "POST",
                        body: formData
                    });

                    if (!response.ok) throw new Error("Request failed.");

                    let data = await response.json();
                    console.log("getTranscription: ", data.text);
                    console.log("getTranscription: ", data.recommendedText);

                    appendToChatHistory(data.text, false);

                    await chat(data.text);
                } catch (error) {
                    alert("Request failed. Please check server settings.");
                }
            }

            async function chat(text) {
                let formData = new FormData();
                formData.append("sessionId", sessionId);
                //formData.append("topic", "English Grammar");
                formData.append("text", text);
                formData.append("action", "chat");

                try {
                    let response = await fetch("VoiceChatHandler.ashx", {
                        method: "POST",
                        body: formData
                    });

                    if (!response.ok) throw new Error("Request failed.");

                    let data = await response.json();
                    console.log("chat: ", data.text);
                    console.log("chat: ", data.translatedText);

                    appendToChatHistory(data.text, true);

                    let audioElement = document.getElementById("responseAudio");
                    let audioSrc = "data:audio/mp4;base64," + data.audioBase64;
                    audioElement.src = audioSrc;

                    audioElement.play().catch(error => {
                        console.error("Autoplay failed. Please play the audio manually.", error);
                    });
                } catch (error) {
                    alert("Request failed. Please check server settings.");
                }
            }

            function appendToChatHistory(text, isChatbot) {
                let message = `
                    <div class="chat-row ${isChatbot ? 'bot-message' : 'user-message'}">
                        <div class="chat-bubble ${isChatbot ? 'bot-bubble' : 'user-bubble'}">${text}</div>
                    </div>
                `;
                $("#chatHistory").append(message);
            }

            $("#recordButton").click(async function () {
                let isRecording = $(this).attr("data-recording") === "true";

                if (!isRecording) {
                    try {
                        const stream = await navigator.mediaDevices.getUserMedia({ audio: true });
                        mediaRecorder = new MediaRecorder(stream);
                        audioChunks = [];

                        mediaRecorder.ondataavailable = event => {
                            audioChunks.push(event.data);
                        };

                        mediaRecorder.onstop = async () => {
                            const audioBlob = new Blob(audioChunks, { type: "audio/webm" });
                            await sendAudio(audioBlob);
                        };

                        mediaRecorder.start();
                        $(this).text("Stop Recording").attr("data-recording", "true");
                    } catch (error) {
                        alert("Unable to record. Please ensure microphone access is allowed in your browser.");
                    }
                } else {
                    if (mediaRecorder && mediaRecorder.state !== "inactive") {
                        mediaRecorder.stop();
                    }
                    $(this).text("Start Recording").attr("data-recording", "false");
                }
            });
        });
    </script>

    <style>
        #chatHistory {
            max-width: 600px;
            margin: 20px auto;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 10px;
            background-color: #f9f9f9;
        }
        .chat-row {
            display: flex;
            margin-bottom: 10px;
        }
        .bot-message { justify-content: flex-start; }
        .user-message { justify-content: flex-end; }
        .chat-bubble {
            padding: 10px 15px;
            border-radius: 15px;
            max-width: 70%;
            font-size: 16px;
        }
        .bot-bubble { background-color: #e1f5fe; color: #000; }
        .user-bubble { background-color: #4caf50; color: white; }
    </style>
</body>
</html>

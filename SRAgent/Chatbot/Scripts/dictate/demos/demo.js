// Global UI elements:
//  - log: event log
//  - trans: transcription window

// Global objects:
//  - tt: simple structure for managing the list of hypotheses
//  - dictate: dictate object with control methods 'init', 'startListening', ...
//       and event callbacks onResults, onError, ...
// ************************************************************************************************
//const levels = {"alphabet": "26字母", "vocab_alphabet": "26個字母(發音)", "vocab_short_vowel": "短母音", "vocab_long_vowel": "長母音", "vocab_double_vowel": "雙母音", "vocab_double_consonant": "雙子音", "vocab_multisyllable": "多音節", "sentence": "句子", "essay": "短文"};
const levels          = {"sentence": "句子", "essay": "短文"};
const SERVER_PATH     = "smil.empowerchinese.net";
const PORT            = "8366";
const PAGE_NAME       = "capt-en";
var gSample_sentences = {};
var gSentence         = [];
var gSent_idx         = 0;
//var gDetect_error     = false; //if occur error diable record button
var gWav_demos        = [];
// ************************************************************************************************
var tt = new Transcription();

var dictate = new Dictate({
    // ********************************************************************************************
    //server:       "wss://bark.phon.ioc.ee:8443/dev/duplex-speech-api/ws/speech",
    //serverStatus: "wss://bark.phon.ioc.ee:8443/dev/duplex-speech-api/ws/status",
    server:       "wss://" + SERVER_PATH + ":" + PORT + "/client/ws/speech",
    serverStatus: "wss://" + SERVER_PATH + ":" + PORT + "/client/ws/status",
    // ********************************************************************************************
    recorderWorkerPath: "../lib/recorderWorker.js",
    onReadyForSpeech : function() {
        console.log("READY FOR SPEECH");
        // ****************************************************************************************
        $("#wordScore").val("");
        $("#fluencyScore").val("");
        ////$("#recognitionResults").text("");
        $("#recognitionError").text("");
        //$("#spinner").addClass("text-primary");
        // ****************************************************************************************
    },
    onEndOfSpeech : function() {
        console.log("END OF SPEECH");
        // ****************************************************************************************
        //$("#spinner").removeClass("text-primary");
        // ****************************************************************************************
    },
    onEndOfSession : function() {
        console.log("END OF SESSION");
        // ****************************************************************************************
        if (isRecording)
            $("#recorder").trigger("click"); // stop recording (abort)
        // ****************************************************************************************
    },
    onServerStatus : function(json) {
        console.log("SERVER STATUS: num_workers_available = " + json.num_workers_available + ", num_requests_processed = " + json.num_requests_processed);
        // ****************************************************************************************
        // [Tian-Hong]
        //if (json.num_workers_available == 0 || gDetect_error) {
        // ****************************************************************************************
        if (json.num_workers_available == 0) {
        //    $("#buttonStart").prop("disabled", true);
        //    $("#serverStatusBar").addClass("highlight");
        } else {
        //    $("#buttonStart").prop("disabled", false);
        //    $("#serverStatusBar").removeClass("highlight");
        }
    },
    onPartialResults : function(hypos) {
        console.log("PARTIAL RESULTS: " + hypos);
        // ****************************************************************************************
        // [Source]
        // TODO: demo the case where there are more hypos
        //tt.add(hypos[0].transcript, false);
        //__updateTranscript(tt.toString());
        // ****************************************************************************************
    },
    // ********************************************************************************************
    //onResults: function (hypos) {
    onResults: function (trans_list, word_score_list, word_fluency_score_list, phone_list, phone_duration_list, stress_list, sound_phone_list) {
        console.log("RESULTS: (1) " + trans_list);
        console.log("RESULTS: (2) " + word_score_list);
        console.log("RESULTS: (3) " + word_fluency_score_list);
        console.log("RESULTS: (4) " + phone_list);
        console.log("RESULTS: (5) " + phone_duration_list);
        console.log("RESULTS: (6) " + stress_list);
        console.log("RESULTS: (7) " + sound_phone_list);
        // TODO: demo the case where there are more results
        // ****************************************************************************************
        // [Source]
        //tt.add(hypos[0].transcript, true);
        //__updateTranscript(tt.toString());
        // ****************************************************************************************
        // diff() is defined only in diff.html
        if (typeof (diff) == "function") {
            diff();
        }
        // ****************************************************************************************
        // Word Score: word_score_list
        let wordScore = 0;
        for (let i = 0; i < word_score_list.length; i++)
            wordScore += word_score_list[i];
        wordScore = (wordScore / word_score_list.length).toFixed();
        console.log("Word Score: " + wordScore);

        // Fluency Score: word_fluency_score_list
        let fluencyScore = 0;
        for (let i = 0; i < word_fluency_score_list.length; i++)
            fluencyScore += word_fluency_score_list[i];
        fluencyScore = (fluencyScore / word_fluency_score_list.length).toFixed();
        console.log("Fluency Score: " + fluencyScore);

        // Phoneme Score: phone_list
        let phonemeScore = 0;
        let count = 0;
        for (let i = 0; i < trans_list.length; i++) {
            for (let j = 0; j < phone_list[i].length; j += 2) {
                phonemeScore += phone_list[i][j + 1];
                count++;
            }
        }
        phonemeScore = (phonemeScore / count).toFixed();
        console.log("Phoneme Score: " + phonemeScore);

        // Word:        trans_list
        // Phone:       phone_list
        // Score:       phone_list
        // Stress:      stress_list
        // Sounds like: sound_phone_list
        // Duration:    phone_duration_list

        $("#wordScore").val(wordScore);
        $("#fluencyScore").val(fluencyScore);
        $("#speechResult").val(word_score_list.join(" "));
        //$("#recognitionResults").text("Word Score: " + wordScore + ", " + "Fluency Score: " + fluencyScore);
        $("#recognitionResults").text("Word Score: " + wordScore);

        // Add style to speech context
        let speechContext = $("#speechContext").val();
        if (speechContext.length != 0) {
            let outputText = styleSpeechContext(speechContext, word_score_list);
            ////$("#recognitionResults").html($("#recognitionResults").text() + "<br>" + outputText);
            $("#recognitionResults").html(outputText);
        }

        // [Tian-Hong]
        //__SetFinalPrompt(trans_list, word_score_list, word_fluency_score_list, phone_list, phone_duration_list, stress_list, sound_phone_list);
        // ****************************************************************************************
    },
    onError : function(code, data) {
        console.log("ERROR: " + code + ", " + (data || ''));
        // ****************************************************************************************
        // [Tian-Hong]
        // gDetect_error = true;
        // $("#buttonStart").prop("disabled", true);
        //document.getElementById("buttonStart").style.cursor = "not-allowed";
        ////$("#recognitionResults").text("ERROR: " + code + ", " + (data || ''));
        const messages1 = {
            "en-US": "No user media support.",
            "zh-CN": "No user media support. 无法存取麦克风。",
            "zh-TW": "No user media support. 無法存取麥克風。",
            "id-ID": "No user media support. Tidak dapat mengakses mikrofon.",
            "vi-VN": "No user media support. Không thể truy cập micro."
        };
        const messages2 = {
            "en-US": "Speech recognition error!",
            "zh-CN": "Speech recognition error! 语音识别错误！",
            "zh-TW": "Speech recognition error! 語音辨識錯誤！",
            "id-ID": "Speech recognition error! Kesalahan pengenalan suara!",
            "vi-VN": "Speech recognition error! Lỗi nhận dạng giọng nói!"
        };
        const culture = $("#culture").val() || "en-US";
        const message1 = messages1[culture] || messages1["en-US"];
        const message2 = messages2[culture] || messages2["en-US"];

        const ERR_CLIENT = 5;
        if (code == ERR_CLIENT && data == "No user media support") {
            $("#recognitionError").text(message1);
        } else {
            $("#recognitionError").text(message2);
        }
        // ****************************************************************************************
        __error(code, data);
        dictate.cancel();
    },
    onEvent : function(code, data) {
        console.log("EVENT: " + code + ", " + (data || ''));
        // ****************************************************************************************
        // [Tian-Hong]
        //$("#buttonStart").prop("disabled", false);
        //document.getElementById("buttonStart").style.cursor = "auto";
        //if (code == 8) { // MSG_WEB_SOCKET
        //    var data = JSON.parse(data);
        //}
        // ****************************************************************************************
    }
});

// Private methods (called from the callbacks)
// ************************************************************************************************
// [Source]
//function __message(code, data) {
//    log.innerHTML = "msg: " + code + ": " + (data || '') + "\n" + log.innerHTML;
//}
// [Tian-Hong]
function __message(data) {
    //lexicon = data.result.hypotheses[0].transcript.split(/\s+/)
    //var score = 0
    //for(i=0; i<lexicon.length/2-1; i++){
    //    score = score + Number(lexicon[i*2+1])
    //}
    //score = Math.floor(score * 100) / 100
    return data;
}
// ************************************************************************************************

function __error(code, data) {
    // ********************************************************************************************
    // [Source]
    //log.innerHTML = "ERR: " + code + ": " + (data || '') + "\n" + log.innerHTML;
    // [Tian-Hong]
    if (code == 5) {         // ERR_CLIENT
        //gDetect_error = true;
        //$("#buttonStart").prop("disabled", true);
        //console.log("Please insert your microphone!");
    } else if (code == 6) {  // ERR_PROMPT
    //    document.getElementById("buttonStart").style.display = "block";
    //    document.getElementById("buttonStop").style.display  = "none";
    } else if (code == 12) { // ERR_ALIGN
    //    document.getElementById("buttonStart").style.display = "block";
    //    document.getElementById("buttonStop").style.display  = "none";
    }
    // ********************************************************************************************
}

function __status(msg) {
    statusBar.innerHTML = msg;
}

function __serverStatus(msg) {
    serverStatusBar.innerHTML = msg;
}

// ************************************************************************************************
// [Source]
//function __updateTranscript(text) {
//    $("#trans").val(text);
//}
// [Tian-Hong]
function __updateTranscript(text, value) {
    $("#trans_origin").text(text);
    $("#trans_origin").val(value);
    log.innerHTML = "";
    modal.innerHTML = "";
}
// ************************************************************************************************

// Public methods (called from the GUI)
function toggleLog() {
    $(log).toggle();
}

function clearLog() {
    log.innerHTML = "";
}

// [Source]
//function clearTranscription() {
//    tt = new Transcription();
//    $("#trans").val("");
//}

function startListening() {
    // ********************************************************************************************
    // [Tian-Hong]
    //document.getElementById("buttonStart").style.display = "none";
    //document.getElementById("buttonStop").style.display  = "block";
    //__SetFinalPrompt("...");
    // ********************************************************************************************
    dictate.startListening();
}

function stopListening() {
    // ********************************************************************************************
    // [Tian-Hong]
    //document.getElementById("buttonStart").style.display = "block";
    //document.getElementById("buttonStop").style.display  = "none";
    // ********************************************************************************************
    dictate.stopListening();
}

function cancel() {
    dictate.cancel();
}

function init() {
    dictate.init();
}

// [Source]
//function showConfig() {
//    var pp = JSON.stringify(dictate.getConfig(), undefined, 2);
//    log.innerHTML = pp + "\n" + log.innerHTML;
//    $(log).show();
//}

// ************************************************************************************************
//function styleRecognitionResult(wordScore) {
//    if (wordScore < 60)
//        return "<div class='level-fair'><i class='fa-solid fa-face-frown'></i><span class=''>Fair</span></div>";
//    else if (wordScore < 80)
//        return "<div class='level-good'><i class='fas fa-smile-beam' aria-hidden='true'></i><span class=''>Good</span></div>";
//    else
//        return "<div class='level-excellent'><i class='fas fa-grin-stars' aria-hidden='true'></i><span class=''>Excellent</span></div>";
//}

function styleSpeechContext(speechContext, word_score_list) {
    let pattern = /(\b\w+'\w+\b)|(<br>)|(\W)/;
    let wordArray = speechContext.split(pattern).filter(word => word != undefined);
    let n = 0;

    for (let i = 0; i < wordArray.length; i++) {
        if (/(\w)/.test(wordArray[i]) && wordArray[i] != "<br>") {
            if (word_score_list[n] < 60)
                wordArray[i] = "<span class='speak-fair'>" + wordArray[i] + "</span>";
            else if (word_score_list[n] < 80)
                wordArray[i] = "<span class='speak-good'>" + wordArray[i] + "</span>";
            else
                wordArray[i] = "<span class='speak-excellent'>" + wordArray[i] + "</span>";
            n++;
        }
    }

    return wordArray.join("");
}

// ************************************************************************************************
// [Tian-Hong]
function setSentenceList(fname){
    sentence = gSample_sentences[fname];
    var select_name = '#select_' + fname + '_list';

    // ********************************************************************************************
    //var rawFile = new XMLHttpRequest();
    //rawFile.open("GET", "../data/samples/" + fname + ".txt", false);
    //rawFile.onreadystatechange = function () {
    //    if (rawFile.readyState === 4) {
    //        if (rawFile.status === 200 || rawFile.status == 0) {
    //            var allText = rawFile.responseText;
    //            allText = allText.split("\n");
    //            for (i = 0; i < allText.length; i++)
    //                sentence.push(allText[i]);
    //        }
    //    }
    //}
    //rawFile.send(null);
    //sentence.pop();
    sentence.push("My name is Tom.");
    sentence.push("I am seven years old.");
    sentence.push("I am small and thin.");
    // ********************************************************************************************
    $(select_name).empty();

    for (var i = 0; i < sentence.length; i++) {
        words = sentence[i];
        $(select_name).append('<option style="font-family:Times New Roman, Times, serif"' + 
                             ' id="' + fname + '_' + i + 
                             '" value="' + words + '">' + 
                             words + '</option>');
    }
}

function select_level(level) {
    var fname = "";
    var select_name = "";
    gSent_idx = 0;
    // not show all select list.
    for (var i = 0; i < level.options.length; i++) {
        fname = level.options[i].value;
        select_name = '#select_' + fname + '_list';
        $(select_name + ' :nth-child(0)').prop('selected', true);
        $(select_name).hide();
    }
    // show the selected item
    fname = level.options[level.selectedIndex].value;
    select_name = '#select_' + fname + '_list';
    $(select_name).show();
    gSentence = gSample_sentences[fname];
    select_sentence(document.getElementById('select_' + fname + '_list'));
}

function select_sentence(selected_sentence) {
    var selected_text = selected_sentence.options[selected_sentence.selectedIndex].text;
    var selected_value = selected_sentence.options[selected_sentence.selectedIndex].value;
    gSent_idx = selected_sentence.selectedIndex;
    console.log(gSent_idx);
    __updateTranscript(selected_text, selected_value);
}

function prev_sentence() {
    var cur_selected = 'select_' + $('#select_level_list :selected').val() + "_list";
    var i;
    if (gSent_idx == 0) {
        i = gSentence.length - 1;
    } else {
        i = gSent_idx - 1;
    }

    __updateTranscript(gSentence[i], gSentence[i]);
    document.getElementById(cur_selected).selectedIndex = i;
    gSent_idx = i;
}

function next_sentence() {
    var cur_selected = 'select_' + $('#select_level_list :selected').val() + "_list";
    var i;
    if (gSent_idx == gSentence.length - 1) {
        i = 0;
    } else {
        i = gSent_idx + 1
    }

    __updateTranscript(gSentence[i], gSentence[i]);
    document.getElementById(cur_selected).selectedIndex = i;
    gSent_idx = i;
}

function __SetFinalPrompt(trans_list, word_score_list, word_fluency_score_list, phone_list, phone_duration_list, stress_list, sound_phone_list) {
    var user_id       = dictate.getUserID();
    var log           = document.getElementById("log");
    var number        = log.getElementsByTagName("br").length;
    var modal_html    = '';
    var log_tmp       = '';
    var score         = [0, 0];
    var fluency_score = [0, 0];

    if (trans_list != "...") {
        total_score = 0;
        score_idx = 1;
        console.log(user_id);
        for (i = 0; i < trans_list.length; i++) {
            var count_slice = 0;
            // fluency score (magic number! please see in ppx more detailed.)
            word_fluency_score = word_fluency_score_list[i];
            fluency_score[0] += word_fluency_score;
            fluency_score[1] += 1;

            if (word_fluency_score < 85)
                style_desc = "text-decoration:underline;";
            else
                style_desc = "";
            // gop score
            if (word_score_list[i] > 80.0) {
                log_tmp += '<span><span style="color:#2EC4B6;' + style_desc + '">' + trans_list[i] + '</span> </span>';
                modal_html += '<tr> <td style="color:#2EC4B6" rowspan="' + phone_list[i].length / 2 + '">' + trans_list[i] + '</td>';
            } else if (word_score_list[i] <= 80.0 && word_score_list[i] > 60.0) {
                log_tmp += '<span><span style="color:#FFBC42;' + style_desc + '" >' + trans_list[i] + '</span> </span>';
                modal_html += '<tr> <td style="color:#FFBC42" rowspan="' + phone_list[i].length / 2 + '">' + trans_list[i] + '</td>';
            } else {
                log_tmp += '<span><span style="color:#D81159;' + style_desc + '">' + trans_list[i] + '</span> </span>';
                modal_html += '<tr> <td style="color:#D81159" rowspan="' + phone_list[i].length / 2 + '">' + trans_list[i] + '</td>';
            }
            // gop score of phoneme
            for (j = 0, k = 0; j < phone_list[i].length; j += 2, k++) {
                score[0] += Number(phone_list[i][j + 1].toFixed(0));
                score[1] += 1;
                if (j == 0) {
                    modal_html += '<td>' + phone_list[i][j] + '</td><td>' + phone_list[i][j + 1].toFixed(0) + '</td><td>' + stress_list[i][k] + '</td><td>' + sound_phone_list[i][k] + '</td><td>' + phone_duration_list[i][j + 1].toFixed(2) + '</td></tr>';
                } else {
                    modal_html += '<tr><td>' + phone_list[i][j] + '</td><td>' + phone_list[i][j + 1].toFixed(0) + '</td><td>' + stress_list[i][k] + '</td><td>' + sound_phone_list[i][k] + '</td><td>' + phone_duration_list[i][j + 1].toFixed(2) + '</td></tr>';
                }
            }
        }
        log_tmp += '<button title="Info" class="btn btn-circle btn-outline-info btn-sm" data-toggle="modal" data-target="#modal' + number + '" onclick="playRecord(' + "\'" + user_id + "\'" + ', \'modal' + number + '\')"><i class="fa fa-info"></i></button>';
        log_tmp += "<br>";
        log_tmp = "Round " + (number + 1) + ": " + (score[0] / score[1]).toFixed(0) + "&nbsp&nbsp&nbsp&nbsp" + (fluency_score[0] / fluency_score[1]).toFixed(0) + "&nbsp&nbsp&nbsp&nbsp" + log_tmp;
        log.innerHTML = log_tmp + log.innerHTML;
        modal.innerHTML += '<div class="modal fade" id="modal' + number + '" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"> \
                                <div class="modal-dialog"> \
                                    <div class="modal-content"> \
                                        <div class="modal-header"> \
                                            <h3 class="modal-title text-center"> Pronunciation Assessment </h3> \
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button> \
                                        </div> \
                                        <div class="modal-body"> \
                                            <table class="table"> \
                                                <tbody> \
                                                    <tr class="info"> \
                                                        <th>Word</th> \
                                                        <th>Phone</th> \
                                                        <th>Score</th> \
                                                        <th>Stress</th> \
                                                        <th>Sounds like</th> \
														<th>Duration</th> \
                                                    </tr> \
                                                    '+ modal_html + ' \
                                                </tbody> \
                                            </table> \
                                            <div id="wav_player_'+ user_id + '" style="width:100%;"> \
                                        </div> \
                                    </div> \
                                </div> \
                            </div>';
    }
}

function playRecord(user_id, modal_id){
    var wav_player = document.getElementById("wav_player_" + user_id);
    wav_player.innerHTML = "";
	// 呈現waveform圖
	var waveform_html = '<div id="waveform_' + user_id + '" style="width:466px;"></div>	\
						<div id="spectrogram_' + user_id + '" style="width:466px;"></div> \
						<div id="timeline_' + user_id + '" style="width:466px;"></div> \
						<div class="controls"> \
							<div class="row"> \
								<div class="col-sm-7"> \
									<button class="btn btn-primary" id="play_bt_' + user_id + '" data-action="play"> \
										<i class="glyphicon glyphicon-play"></i> \
											Play / <i class="glyphicon glyphicon-pause"></i> Pause \
									</button> \
								</div> \
								<div class="col-sm-1"> \
									<i class="glyphicon glyphicon-zoom-in"></i> \
								</div> \
								<div class="col-sm-3"> \
									<input id="zoom_' + user_id + '" data-action="zoom" type="range" min="20" max="5000" value="0" style="width: 100%" /> \
								</div> \
								<div class="col-sm-1"> \
									<i class="glyphicon glyphicon-zoom-out"></i> \
								</div> \
							</div> \
						</div>'
     wav_player.innerHTML = waveform_html;
     document.getElementById(modal_id).style.display="block";
     var wav_path = "https://" + SERVER_PATH + "/" + PAGE_NAME + "/wavs/" + user_id + ".wav";
     console.log(wav_path);
     var wav_demo = new Wsurfer(user_id, "waveform_" + user_id, "timeline_" + user_id, "spectrogram_" + user_id, "zoom_" + user_id, "play_bt_" + user_id, wav_path);
}

function wavPlay(){
    var fn = "../data/wav/sample_sentence/" + document.getElementById("trans_origin").innerHTML.replace(/ /g, "_").replace(/\?|\.|\!/g, "")+ ".mp3";
    var audio = new Audio(fn);
    audio.addEventListener("ended", function(){
        $("#wavPlay").prop("disabled", false);
        document.getElementById("wavPlay").style.cursor = null;
    });
    audio.play();
    $("#wavPlay").prop("disabled", true);
    document.getElementById("wavPlay").style.cursor = "not-allowed";
}
// ************************************************************************************************

window.onload = function() {
    //init();
    // ********************************************************************************************
    // [Tian-Hong]
    // load different level
    //$('#level_selector').append('<select id="select_level_list" style="font-family: Times New Roman, Times, serif" class="form-control" onchange="select_level(this)"></select><br />');
    //for (const [key, value] of Object.entries(levels)) {
    //    $("#select_level_list").append('<option style="font-family: Times New Roman, Times, serif" value="' + key + '">' + value + '</option>');
    //    $('#level_selector').append('<select id="select_' + key + '_list" style="font-family: Times New Roman, Times, serif; display:none;" class="form-control" onchange="select_sentence(this)"></select>');
    //    // load init. txt
    //    gSample_sentences[key] = [];
    //    setSentenceList(key);
    //}
    //first_key = Object.keys(levels)[0];
    //$("#select_" + first_key + "_list").show();
    //select_sentence(document.getElementById("select_" + first_key + "_list"));
    //gSentence = gSample_sentences[first_key];

    //$("#trans_origin").text("My name is Tom.");
    // ********************************************************************************************
};

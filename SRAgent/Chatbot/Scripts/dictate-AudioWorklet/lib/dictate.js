(function(window){

    // Defaults
    // ********************************************************************************************
    // [Source]
    //var SERVER = "ws://bark.phon.ioc.ee:82/dev/duplex-speech-api/ws/speech";
    //var SERVER_STATUS = "ws://bark.phon.ioc.ee:82/dev/duplex-speech-api/ws/status";
    //var REFERENCE_HANDLER = "http://bark.phon.ioc.ee:82/dev/duplex-speech-api/dynamic/reference";
    // [Tian-Hong]
    var SERVER = "ws://140.122.185.219:5678";
    var SERVER_STATUS = "ws://140.122.185.219:5678";
    // TODO: how to send a transcript?
    var REFERENCE_HANDLER = "http://140.122.185.219:5678";
    // ********************************************************************************************
    var CONTENT_TYPE = "content-type=audio/x-raw,+layout=(string)interleaved,+rate=(int)16000,+format=(string)S16LE,+channels=(int)1";
    // Send blocks 4 x per second as recommended in the server doc.
    var INTERVAL = 250;
    var TAG_END_OF_SENTENCE = "EOS";
    // ********************************************************************************************
    //var RECORDER_WORKER_PATH = 'recorderWorker.js';
    var RECORDER_WORKER_PATH = '../../Chatbot/Scripts/dictate/lib/recorderWorker.js';
    // ********************************************************************************************

    // Error codes (mostly following Android error names and codes)
    var ERR_NETWORK = 2;
    var ERR_AUDIO = 3;
    var ERR_SERVER = 4;
    var ERR_CLIENT = 5;
    // ********************************************************************************************
    // [Tian-Hong]
    var ERR_PROMPT = 6;
    var ERR_ALIGN = 12;
    // ********************************************************************************************

    // Event codes
    var MSG_WAITING_MICROPHONE = 1;
    var MSG_MEDIA_STREAM_CREATED = 2;
    var MSG_INIT_RECORDER = 3;
    var MSG_RECORDING = 4;
    var MSG_SEND = 5;
    var MSG_SEND_EMPTY = 6;
    var MSG_SEND_EOS = 7;
    var MSG_WEB_SOCKET = 8;
    var MSG_WEB_SOCKET_OPEN = 9;
    var MSG_WEB_SOCKET_CLOSE = 10;
    var MSG_STOP = 11;
    var MSG_SERVER_CHANGED = 12;
    var MSG_AUDIOCONTEXT_RESUMED = 13;

    // Server status codes
    // from https://github.com/alumae/kaldi-gstreamer-server
    var SERVER_STATUS_CODE = {
        0: 'Success', // Usually used when recognition results are sent
        1: 'No speech', // Incoming audio contained a large portion of silence or non-speech
        2: 'Aborted', // Recognition was aborted for some reason
        9: 'No available', // Recognizer processes are currently in use and recognition cannot be performed
    };

    var Dictate = function(cfg) {
        var config = cfg || {};
        config.server = config.server || SERVER;
        config.audioSourceId = config.audioSourceId;
        config.serverStatus = config.serverStatus || SERVER_STATUS;
        config.referenceHandler = config.referenceHandler || REFERENCE_HANDLER;
        config.contentType = config.contentType || CONTENT_TYPE;
        config.interval = config.interval || INTERVAL;
        // ****************************************************************************************
        //config.recorderWorkerPath = config.recorderWorkerPath || RECORDER_WORKER_PATH;
        config.recorderWorkerPath = RECORDER_WORKER_PATH;
        // ****************************************************************************************
        config.onReadyForSpeech = config.onReadyForSpeech || function() {};
        config.onEndOfSpeech = config.onEndOfSpeech || function() {};
        config.onPartialResults = config.onPartialResults || function(data) {};
        config.onResults = config.onResults || function(data) {};
        config.onEndOfSession = config.onEndOfSession || function() {};
        config.onEvent = config.onEvent || function(e, data) {};
        config.onError = config.onError || function(e, data) {};
        config.rafCallback = config.rafCallback || function(time) {};
        if (config.onServerStatus) {
            monitorServerStatus();
        }

        // Initialized by init()
        var audioContext;
        var recorder;
        // Initialized by startListening()
        var ws;
        // ****************************************************************************************
        // [Tian-Hong]
        var user_id;
        // ****************************************************************************************
        var intervalKey;
        // Initialized during construction
        var wsServerStatus;

        // Returns the configuration
        this.getConfig = function() {
            return config;
        }

        // ****************************************************************************************
        // [Tian-Hong]
        this.getUserID = function () {
            return user_id;
        }
        // ****************************************************************************************

        // Set up the recorder (incl. asking permission)
        // Initializes audioContext
        // Can be called multiple times.
        // TODO: call something on success (MSG_INIT_RECORDER is currently called)
        this.init = function() {
            var audioSourceConstraints = {};
            config.onEvent(MSG_WAITING_MICROPHONE, "Waiting for approval to access your microphone ...");
            try {
                window.AudioContext = window.AudioContext || window.webkitAudioContext;
                navigator.mediaDevices.getUserMedia = navigator.mediaDevices.getUserMedia || navigator.mediaDevices.webkitGetUserMedia || navigator.mediaDevices.mozGetUserMedia;
                window.URL = window.URL || window.webkitURL;
                audioContext = new AudioContext();

                // ********************************************************************************
                // [Source]
                //if (navigator.mediaDevices.getUserMedia){
                //	if(config.audioSourceId) {
                //		audioSourceConstraints.audio = {
                //			optional: [{ sourceId: config.audioSourceId }]
                //		};
                //	} else {
                //		audioSourceConstraints.audio = true;
                //	}
                //	navigator.mediaDevices.getUserMedia(audioSourceConstraints).then(function(stream){
                //		/* use the stream */
                //		input = audioContext.createMediaStreamSource(stream);
                //		config.onEvent(MSG_MEDIA_STREAM_CREATED, 'Media stream created');
                //					//Firefox loses the audio input stream every five seconds
                //					// To fix added the input to window.source
                //					window.source = input;
                //		window.userSpeechAnalyser = audioContext.createAnalyser();
                //		input.connect(window.userSpeechAnalyser);

                //		config.rafCallback();

                //		recorder = new Recorder(input, { workerPath : config.recorderWorkerPath });
                //		config.onEvent(MSG_INIT_RECORDER, 'Recorder initialized');
                //	});
                //} else {
                //	config.onError(ERR_CLIENT, "No user media support");
                //}
                // ********************************************************************************

            } catch (e) {
                // Firefox 24: TypeError: AudioContext is not a constructor
                // Set media.webaudio.enabled = true (in about:config) to fix this.
                config.onError(ERR_CLIENT, "Error initializing Web Audio browser: " + e);
            }

            // ************************************************************************************
            // [Tian-Hong]
            /*
            if (navigator.getUserMedia) {
                if(config.audioSourceId) {
                    audioSourceConstraints.audio = {
                        optional: [{ sourceId: config.audioSourceId }]
                    };
                } else {
                    audioSourceConstraints.audio = true;
                }
                navigator.getUserMedia(audioSourceConstraints, startUserMedia, function(e) {
                    config.onError(ERR_CLIENT, "No live audio input in this browser: " + e);
                });
            } else {
                config.onError(ERR_CLIENT, "No user media support");
            }*/
            if (navigator.mediaDevices.getUserMedia) {
                navigator.mediaDevices.getUserMedia({ audio: true }).then(function (stream) {
                    startUserMedia(stream)
                })
                    .catch(function (err) {
                        config.onError(ERR_CLIENT, "No user media support");
                    });;
            } else {
                config.onError(ERR_CLIENT, "No user media support");
            }
            // ************************************************************************************
        }

        // Start recording and transcribing
        this.startListening = function() {
            if (! recorder) {
                config.onError(ERR_AUDIO, "Recorder undefined");
                return;
            }

            if (ws) {
                cancel();
            }

            try {
                ws = createWebSocket();
                audioContext.resume().then(() => {
                    config.onEvent(MSG_AUDIOCONTEXT_RESUMED, "Audio context resumed");
                });
            } catch (e) {
                config.onError(ERR_CLIENT, "No web socket support in this browser!");
            }
        }

        // Stop listening, i.e. recording and sending of new input.
        this.stopListening = function() {
            // Stop the regular sending of audio
            clearInterval(intervalKey);
            // Stop recording
            if (recorder) {
                recorder.stop();
                config.onEvent(MSG_STOP, 'Stopped recording');
                // Push the remaining audio to the server
                recorder.export16kMono(function(blob) {
                    socketSend(blob);
                    socketSend(TAG_END_OF_SENTENCE);
                    // ****************************************************************************
                    //recorder.clear();
                    recorder.clear(false);
                    exportWAV();
                    // ****************************************************************************
                }, 'audio/x-raw');
                config.onEndOfSpeech();
            } else {
                config.onError(ERR_AUDIO, "Recorder undefined");
            }
        }

        // Cancel everything without waiting on the server
        this.cancel = function() {
            // Stop the regular sending of audio (if present)
            clearInterval(intervalKey);
            if (recorder) {
                recorder.stop();
                // ********************************************************************************
                //recorder.clear();
                recorder.clear(true);
                // ********************************************************************************
                config.onEvent(MSG_STOP, 'Stopped recording');
            }
            if (ws) {
                ws.close();
                ws = null;
            }
        }

        // Sets the URL of the speech server
        this.setServer = function(server) {
            config.server = server;
            config.onEvent(MSG_SERVER_CHANGED, 'Server changed: ' + server);
        }

        // Sets the URL of the speech server status server
        this.setServerStatus = function(serverStatus) {
            config.serverStatus = serverStatus;

            if (config.onServerStatus) {
                monitorServerStatus();
            }

            config.onEvent(MSG_SERVER_CHANGED, 'Server status server changed: ' + serverStatus);
        }

        // Sends reference text to speech server
        this.submitReference = function submitReference(text, successCallback, errorCallback) {
            var headers = {}
            if (config["user_id"]) {
                headers["User-Id"] = config["user_id"]
            }
            if (config["content_id"]) {
                headers["Content-Id"] = config["content_id"]
            }
            $.ajax({
                url: config.referenceHandler,
                type: "POST",
                headers: headers,
                data: text,
                dataType: "text",
                success: successCallback,
                error: errorCallback,
            });
        }

        // Private methods
        // ****************************************************************************************
        function exportWAV() {
            recorder.exportWAV(function (blob) {
                console.log("exportWAV: " + blob.size);
                blobs = blob;
                //const downloadLink = document.getElementById("download");
                //downloadLink.href = URL.createObjectURL(blob);
                //downloadLink.download = "output.wav";
                let audio = document.getElementById("audioRecording");
                audio.src = URL.createObjectURL(blob);
                recorder.clear(true);
            }, 'audio/wav');
        }

        // [Tian-Hong]
        function startUserMedia(stream) {
            var input = audioContext.createMediaStreamSource(stream);
            config.onEvent(MSG_MEDIA_STREAM_CREATED, 'Media stream created');
            //Firefox loses the audio input stream every five seconds
            // To fix added the input to window.source
            window.source = input;

            // make the analyser available in window context
            window.userSpeechAnalyser = audioContext.createAnalyser();
            input.connect(window.userSpeechAnalyser);

            config.rafCallback();

            recorder = new Recorder(input, { workerPath: config.recorderWorkerPath });
            config.onEvent(MSG_INIT_RECORDER, 'Recorder initialized');
        }
        // ****************************************************************************************
        function socketSend(item) {
            if (ws) {
                var state = ws.readyState;
                if (state == 1) {
                    // If item is an audio blob
                    if (item instanceof Blob) {
                        if (item.size > 0) {
                            ws.send(item);
                            config.onEvent(MSG_SEND, 'Send: blob: ' + item.type + ', ' + item.size);
                        } else {
                            config.onEvent(MSG_SEND_EMPTY, 'Send: blob: ' + item.type + ', EMPTY');
                        }
                    // Otherwise it's the EOS tag (string)
                    } else {
                        ws.send(item);
                        config.onEvent(MSG_SEND_EOS, 'Send tag: ' + item);
                    }
                } else {
                    config.onError(ERR_NETWORK, 'WebSocket: readyState!=1: ' + state + ": failed to send: " + item);
                }
            } else {
                config.onError(ERR_CLIENT, 'No web socket connection: failed to send: ' + item);
            }
        }


        function createWebSocket() {
            // TODO: do we need to use a protocol?
            //var ws = new WebSocket("ws://127.0.0.1:8081", "echo-protocol");
            var url = config.server + '?' + config.contentType;
            if (config["user_id"]) {
                url += '&user-id=' + config["user_id"]
            }
            if (config["content_id"]) {
                url += '&content-id=' + config["content_id"]
            }
            // ************************************************************************************
            // [Tian-Hong]
            // outdated setting (for textarea)
            // var trans = document.getElementById("trans").value;
            var trans = document.getElementById("trans_origin").value;

            trans = trans.replace(/\./g, "");
            trans = trans.replace(/\?/g, "");
            trans = trans.replace(/!/g, "");
            trans = trans.replace(/,/g, "");
            trans = trans.replace(/"/g, "");
            trans = trans.replace(/;/g, "");
            if (trans) {
                url += '&prompt=' + trans;
            }
            user_id = trans.replace(/ /g, "-").replace(/'/g, "") + "_" + new Date().getTime();
            url += '&user-id=' + user_id;
            // ************************************************************************************
            var ws = new WebSocket(url);

            ws.onmessage = function(e) {
                var data = e.data;
                config.onEvent(MSG_WEB_SOCKET, data);
                if (data instanceof Object && ! (data instanceof Blob)) {
                    config.onError(ERR_SERVER, 'WebSocket: onEvent: got Object that is not a Blob');
                } else if (data instanceof Blob) {
                    config.onError(ERR_SERVER, 'WebSocket: got Blob');
                } else {
                    var res = JSON.parse(data);
                    if (res.status == 0) {
                        if (res.result) {
                            if (res.result.final) {
                                // ****************************************************************
                                // [Source]
                                //config.onResults(res.result.hypotheses);

                                // [Tian-Hong]
                                // function average()
                                const average = arr => arr.reduce((p, c) => p + c, 0) / arr.length;

                                var trans_list = trans.split(" ");
                                trans_list = trans_list.filter(Boolean);
                                console.log(res.result);

                                var i = 0, j = 0;
                                var phone_list = [];
                                var phone_duration_list = [];
                                var stress_list = [];
                                var sound_phone_list = [];
                                var word_score_list = [];
                                var word_fluency_score_list = [];

                                var gop_results = res.result.hypotheses.GOP;
                                var stress_results = res.result.hypotheses.Stress;
                                var sound_results = res.result.hypotheses.Sound;
                                var fluency_results = res.result.hypotheses.Fluency;
                                var duration_results = res.result.hypotheses.Duration;
                                // GOP ratio
                                //console.log(gop_results);
                                console.log(duration_results);
                                for (var w_idx = 0; w_idx < gop_results.length; w_idx++) {
                                    // [word, [[phone, score],[phone, score]... ], ...]
                                    // GOP scores
                                    var word = gop_results[w_idx][0];
                                    var scores = gop_results[w_idx][1];
                                    var phone_scores = scores.slice(0, scores.length - 1);
                                    var word_score = scores[scores.length - 1][1];
                                    // Fluency scores
                                    var fluency_scores = fluency_results[w_idx][1];
                                    var phone_fluency_scores = fluency_scores.slice(0, scores.length - 1);
                                    var duration_scores = duration_results[w_idx][1];
                                    var phone_duration_scores = duration_scores.slice(0, scores.length - 1);
                                    console.log(phone_duration_scores);
                                    var word_fluency_score = fluency_scores[scores.length - 1][1];

                                    var tmp_phone_list = [];
                                    var tmp_stress_list = [];
                                    var tmp_sound_phone_list = [];
                                    var tmp_phone_duration_list = [];

                                    for (var p_idx = 0; p_idx < phone_scores.length; p_idx++) {
                                        var phn = phone_scores[p_idx][0];
                                        var score = phone_scores[p_idx][1];
                                        var fluency_score = phone_fluency_scores[p_idx][1];
                                        var duration_score = phone_duration_scores[p_idx][1];
                                        tmp_phone_list.push(phn, score);
                                        tmp_stress_list.push(stress_results[w_idx][1][p_idx][0]);
                                        tmp_sound_phone_list.push(sound_results[w_idx][1][p_idx][0]);
                                        tmp_phone_duration_list.push(phn, duration_score);
                                    }

                                    phone_list.push(tmp_phone_list);
                                    stress_list.push(tmp_stress_list);
                                    sound_phone_list.push(tmp_sound_phone_list);
                                    phone_duration_list.push(tmp_phone_duration_list);
                                    word_score_list.push(word_score);
                                    word_fluency_score_list.push(word_fluency_score);
                                }
                                config.onResults(trans_list, word_score_list, word_fluency_score_list,
                                    phone_list, phone_duration_list, stress_list, sound_phone_list);
                                // ****************************************************************
                            } else {
                                config.onPartialResults(res.result.hypotheses);
                            }
                        }
                    // ****************************************************************************
                    // [Tian-Hong]
                    } else if (res.status == 5) {
                        config.onError(ERR_PROMPT, res.message);
                    } else if (res.status == 12) {
                        config.onError(ERR_ALIGN, res.message);
                    // ****************************************************************************
                    } else {
                        config.onError(ERR_SERVER, 'Server error: ' + res.status + ': ' + getDescription(res.status));
                    }
                }
            }

            // Start recording only if the socket becomes open
            ws.onopen = function(e) {
                // ********************************************************************************
                // [Tian-Hong]
                // FIXME: send transcript with the content of the textarea.
                                //ws.send(trans);
                // ********************************************************************************
                intervalKey = setInterval(function() {
                    recorder.export16kMono(function(blob) {
                        socketSend(blob);
                        // ************************************************************************
                        //recorder.clear();
                        recorder.clear(false);
                        // ************************************************************************
                    }, 'audio/x-raw');
                }, config.interval);
                // Start recording
                recorder.record();
                config.onReadyForSpeech();
                config.onEvent(MSG_WEB_SOCKET_OPEN, e);
            };

            // This can happen if the blob was too big
            // E.g. "Frame size of 65580 bytes exceeds maximum accepted frame size"
            // Status codes
            // http://tools.ietf.org/html/rfc6455#section-7.4.1
            // 1005:
            // 1006:
            ws.onclose = function(e) {
                var code = e.code;
                var reason = e.reason;
                var wasClean = e.wasClean;
                // The server closes the connection (only?)
                // when its endpointer triggers.
                config.onEndOfSession();
                config.onEvent(MSG_WEB_SOCKET_CLOSE, e.code + "/" + e.reason + "/" + e.wasClean);
            };

            ws.onerror = function(e) {
                var data = e.data;
                config.onError(ERR_NETWORK, data);
            }

            return ws;
        }


        function monitorServerStatus() {
            if (wsServerStatus) {
                wsServerStatus.close();
            }
            wsServerStatus = new WebSocket(config.serverStatus);
            wsServerStatus.onmessage = function(evt) {
                config.onServerStatus(JSON.parse(evt.data));
            };
        }


        function getDescription(code) {
            if (code in SERVER_STATUS_CODE) {
                return SERVER_STATUS_CODE[code];
            }
            return "Unknown error";
        }

    };

    // Simple class for persisting the transcription.
    // If isFinal==true then a new line is started in the transcription list
    // (which only keeps the final transcriptions).
    var Transcription = function(cfg) {
        var index = 0;
        var list = [];

        this.add = function(text, isFinal) {
            list[index] = text;
            if (isFinal) {
                index++;
            }
        }

        this.toString = function() {
            return list.join('. ');
        }
    }

    window.Dictate = Dictate;
    window.Transcription = Transcription;

})(window);

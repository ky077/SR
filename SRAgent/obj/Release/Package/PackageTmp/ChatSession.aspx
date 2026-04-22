<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChatSession.aspx.cs" Inherits="SRAgent.ChatSession" %>

<!doctype html>
<html lang="zh-Hant-TW">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="英語文說寫能力檢測平台 聊天機器人">
<meta name="author" content="英語文說寫能力檢測平台">
<meta property="og:locale" content="zh-Hant-TW" />
<meta property="og:type" content="website" />
<meta property="og:title" content="英語文說寫能力檢測平台 聊天機器人" >
<meta property="og:description" content="英語文說寫能力檢測平台 聊天機器人" >
<meta property="og:url" content="https://teemi.tw/">
<meta property="og:image" content="Content/images/TEEMI-bot.png">
<meta property="og:image:type" content="image/png" />
<meta property="og:image:width" content="543" />
<meta property="og:image:height" content="481" />
<meta name="twitter:card" content="summary">
<meta name="twitter:title" content="英語文說寫能力檢測平台 聊天機器人">
<meta name="twitter:image" content="Content/images/TEEMI-bot.png">
<meta itemprop="name" content="英語文說寫能力檢測平台 聊天機器人">
<meta itemprop="description" content="英語文說寫能力檢測平台 聊天機器人">
<meta itemprop="image" content="Content/images/TEEMI-bot.png">
<title><%= Resources.Global.App1 %></title>
<link rel="shortcut icon" type="image/x-icon" href="./Content/images/favicon.ico">
<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+SC:wght@100;300;400;500;700;900&family=Noto+Sans+TC:wght@100;300;400;500;700;900&display=swap"
      rel="stylesheet">

<!-- Icon Font Stylesheet -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" rel="stylesheet">

<!-- Libraries Stylesheet -->
<link rel="stylesheet" href="Content/widgets/animate.css-main/animate.min.css">

<!-- Customized Bootstrap Stylesheet -->
<link rel="stylesheet" type="text/css" href="Content/css/bootstrap.css">

<!-- This web Core Stylesheet -->
<link rel="stylesheet" type="text/css" href="Content/css/styles.css">
</head>

<body>
<a href="#content" title="<%= Resources.Global.App2 %>" tabindex="1" class="visually-hidden-focusable sr-only-goContent"><%= Resources.Global.App2 %></a>
<header>
  <h1 class="header-logo"><img src="Content/images/TEEMI.svg" alt="英語文說寫能力檢測平台"/><span class="visually-hidden">聊天機器人</span></h1>
</header>
<main id="content">

<!-- Modal#start -->
<div class="modal fade show modal-start" tabindex="-1" style="display: block;" aria-modal="true" role="dialog">
  <div class="modal-dialog modal-fullscreen modal-dialog-centered">
    <div class="modal-content border-0 bg-black bg-opacity-75">
      <div class="modal-body py-0 text-center">
        <div class="d-inline-flex flex-column"> 
          <!-- robot-frame START -->
          <div class="robot-frame">
            <div class="avatar">
              <svg version="1.1" id="TEEMI-Bot-hi" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px"
	 y="0px" viewBox="0 0 670 530" style="enable-background:new 0 0 670 530;" xml:space="preserve">
                <path id="foot" class="st0" d="M338.3,496.9c0,0,29.6-0.2,58-1.9c-11.6,11.6-38.1,35.4-60.1,34.9c-20.9-0.4-45.8-22.6-58.3-35.1
	C307.1,496.6,338.3,496.8,338.3,496.9L338.3,496.9L338.3,496.9z"/>
                <path id="rightHand" class="st1" d="M146.6,352.8c-7.7-10.1-16.4-19-25.5-26.8c-32.6-28.1-70.1-43.1-80.4-54.4
	c-0.4-0.4-0.7-0.8-1-1.2c-0.2-0.2-0.4-0.5-0.5-0.8c-0.2-0.3-0.4-0.6-0.5-0.8l0,0c-0.2-0.4-0.3-0.8-0.4-1.2
	c-3.3-14.8,13.2-30.6,80.6-23c13.9,1.6,26.5,4.2,37.8,7.3c28.1,7.8,41.7,40.3,26.4,65c-7.6,12.3-19.1,25.1-36.5,36l0,0L146.6,352.8z
	"/>
                <path id="leftHand" class="st1" d="M458.7,330c11.1,2.5,21.6,6.4,31.5,10.9c35.2,16.2,61.4,41.3,74.5,45.6c0.5,0.1,0.9,0.3,1.4,0.4
	c0.3,0,0.5,0.1,0.8,0.1s0.6,0.1,0.9,0.1l0,0c0.4,0,0.8,0,1.2-0.1c13.3-2.8,20.2-22.2-11.2-74.6c-6.4-10.8-13.3-20.1-20-28.3
	c-16.8-20.1-48.5-19.2-63,2.6c-7.2,10.8-13.4,25-15.9,43.3H458.7L458.7,330z"/>
                <g id="body">
                  <path id="bodyShadow" class="st0" d="M361.2,452.5C314.4,457.6,244,445,199,417.7c-14.8-8.5-27.1-17.7-35.6-26.3
		c-14.1-14.5-22.6-38.1-27.6-58.6c0,5,0.2,9.7,0.5,13.7c1.6,18,8.5,57.7,27.5,78.6c7.1,7.6,17.3,15.8,29.5,23.5
		c37.4,24.7,95.8,39,135.2,38h0.4c38.9,0.5,95.6-13.6,132.6-37.9c12.9-8,23.6-16.6,30.9-24.5c7-7.6,12.4-16.8,16.5-26.6
		c-41.8,30.9-103.6,51.8-147.3,54.9h-0.5L361.2,452.5L361.2,452.5z"/>
                  <path id="bodyMain" class="st1" d="M520.1,345.7v-3.6c0.2-17.5,4.1-135.8-8.7-159.1c-4-5.6-8.8-10.9-14.3-15.6
		c-3.2-2.7-6.6-5.3-10.2-7.6c-26-16.3-62.2-24.8-94.9-28.6c-1.7-0.2-3.4-0.4-5.1-0.6c-18.5-1.9-35.6-2.4-49-2.5h-26.1
		c-38.2,0-106.6,4.9-148.8,31.4c-45.1,27.2-24.8,143.1-26,152.4c-0.9,7-1.2,14.2-1.2,20.8c5,20.5,13.5,44.1,27.6,58.6
		c8.5,8.6,20.8,17.8,35.5,26.3c45,27.4,115.4,40,162.2,34.8h0.5c43.8-3.1,105.5-24,147.3-54.9c3.5-8.5,6.1-17.5,7.9-26.5
		c1.7-8.6,2.9-17.2,3.2-25.5l0,0L520.1,345.7L520.1,345.7L520.1,345.7z"/>
                </g>
                <g id="tele">
                  <path id="tube" class="st0" d="M393.4,78.8c-6.6,0.2-11.9,5.8-11.7,12.5c0.2,4.8,3.1,8.9,7.2,10.7l-3.7,28.2
		c-0.2,1.5,0.8,2.8,2.3,3h0.4c1.3,0,2.5-1,2.7-2.3l3.7-27.9l0,0c3.2,0,6.2-1.5,8.4-3.9c2.1-2.2,3.2-5.2,3.2-8.3v-0.4
		c-0.1-3.2-1.5-6.2-3.8-8.4C399.7,79.8,396.6,78.6,393.4,78.8L393.4,78.8L393.4,78.8z"/>
                  <path id="leftWave1" class="st0" d="M425.4,71.7c-1.4-0.6-3,0-3.5,1.4c-0.6,1.4,0,3,1.4,3.5c2.3,1,4.2,3.3,5,6.2
		c1,3.4,0.2,7-2,10.2c-0.9,1.2-0.5,2.9,0.7,3.7c0.5,0.3,1,0.5,1.5,0.5c0.9,0,1.7-0.4,2.2-1.2c3.1-4.5,4.1-9.8,2.7-14.7
		C432.2,77,429.2,73.4,425.4,71.7L425.4,71.7L425.4,71.7z"/>
                  <path id="leftWave2" class="st0" d="M453.7,75.2c-1.8-6.6-6.4-12-12.1-14.5c-1.4-0.6-3,0-3.5,1.4c-0.6,1.4,0,2.9,1.4,3.5
		c4.3,1.9,7.6,6,9.1,11.1c1.7,6,0.5,12.4-3.5,18c-0.9,1.2-0.5,2.9,0.7,3.8c0.5,0.3,1,0.5,1.5,0.5c0.9,0,1.7-0.4,2.2-1.2
		c4.8-7,6.3-15,4.2-22.5l0,0L453.7,75.2z"/>
                  <path id="rightWave1" class="st0" d="M361,63.3c-4,1-7.6,4-9.6,8c-2.2,4.6-2.2,10,0.1,15c0.5,1,1.4,1.6,2.5,1.6s0.8,0,1.1-0.2
		c1.4-0.6,2-2.2,1.3-3.6c-1.6-3.6-1.7-7.3-0.1-10.4c1.3-2.6,3.5-4.6,6-5.2c1.4-0.4,2.3-1.8,2-3.2C363.9,63.9,362.5,63,361,63.3
		L361,63.3L361,63.3z"/>
                  <path id="rightWave2" class="st0" d="M350.1,51.6c-0.4-1.4-1.8-2.3-3.3-2c-6.1,1.5-11.5,6.1-14.4,12.2c-3.4,7.1-3.3,15.2,0.2,22.9
		c0.5,1,1.4,1.6,2.5,1.6s0.8,0,1.1-0.2c1.4-0.6,1.9-2.2,1.3-3.6c-2.9-6.2-2.9-12.7-0.2-18.3c2.3-4.7,6.3-8.2,10.9-9.3
		c1.4-0.4,2.3-1.8,2-3.3H350.1z"/>
                </g>
                <g id="head">
                  <path id="face" class="st2" d="M446.9,302.6c-28.1,11.5-81.8,11.5-124.5,11.5s-96.4,0-124.5-11.5s-39.7-82.1-27-105.7
		c12.8-23.5,85.6-39.5,151.4-39.5s138.7,15.9,151.4,39.5c12.8,23.6,1.1,94.2-27,105.7H446.9z"/>
                  <path id="mouth" class="st0" d="M353.8,228.1l-63.4,6.5c-7.9,0.8-13,9-9.9,16.3c20,46.7,72.1,45.3,85.9-7.7
		c2.1-8.1-4.4-15.9-12.7-15.1H353.8z"/>
                  <path id="rightEye" class="st0" d="M259.5,201.1c0,6.2-5.1,11.3-11.3,11.3s-11.3-5.1-11.3-11.3s5.1-11.3,11.3-11.3
		S259.5,194.9,259.5,201.1z"/>
                  <circle id="leftEye" class="st0" cx="408.3" cy="201.1" r="11.3"/>
                </g>
              </svg>
            </div>
            <div class="dialog">
              <div class="dialog-text">
                <h2 class="h4"></h2>
                <h2 class="h4"><%= Resources.Global.ChatSession19 %></h2>
              </div>
            </div>
          </div>
          <!-- robot-frame END --> 
          <!-- img START --> 
			<div class="guide-img">
          <img src='<%= "Content/images/chat-guide_" + System.Threading.Thread.CurrentThread.CurrentUICulture.Name + ".png" %>' alt="聊天介面導覽圖" class="img-fluid"/>  </div>
          <!-- img END --> 
          <!-- btn START --><div class="guide-btn">
          <button type="button" class="btn btn-outline-guide btn-lg rounded-pill m-2 px-4" id="start" ><%= !System.Threading.Thread.CurrentThread.CurrentUICulture.Name.Equals("en-US") ? Resources.Global.ChatSession21 + " " + Resources.Global.ChatSession20 : Resources.Global.ChatSession20 %></button></div>
          <!-- btn END --> 
        </div>
      </div>
    </div>
  </div>
</div>

  <div class="container-xl"> 
    <!-- futuristic-frame START -->
    <div class="futuristic-frame chat wow animate__animated animate__zoomIn">
      <div class="futuristic-frame-border">
        <div class="futuristic-frame-content px-0"> 
          <!-- -->
          <div class="futuristic-frame-tool"> <a id="chatEnd" href="ChatEnd.aspx"><i class="fa-solid fa-arrow-right-from-bracket me-1" aria-hidden="true" title='<%= !System.Threading.Thread.CurrentThread.CurrentUICulture.Name.Equals("en-US") ? Resources.Global.ChatSession23 + " " + Resources.Global.ChatSession22 : Resources.Global.ChatSession22 %>'></i><span><%= !System.Threading.Thread.CurrentThread.CurrentUICulture.Name.Equals("en-US") ? Resources.Global.ChatSession23 : "" %></span>&nbsp;<span><%= Resources.Global.ChatSession22 %></span></a> </div>
          <!-- -->
          <div class="chatInterface-bar">
            <div id="progressLabel" class="progress-count"><span>5</span>/<span>10</span></div>
            <div class="progress-bar">
              <div id="progress" class="progress-bar-fill" style="width: 50%;"></div>
            </div>
            <div class="dropdown">
              <button class="btn btn-link dropdown-toggle btn__speed" type="button" data-bs-toggle="dropdown" aria-expanded="false" title="<%= Resources.Global.ChatSession1 %>"><i class="fa-solid fa-forward"></i><span>1x</span></button>
              <ul class="dropdown-menu dropdown-menu-end small">
                <li>
                  <h6 class="dropdown-header"><%= Resources.Global.ChatSession2 %></h6>
                </li>
                <li><a class="dropdown-item" href="javascript:void(0)">0.5x</a></li>
                <li><a class="dropdown-item" href="javascript:void(0)">0.75x</a></li>
                <li><a class="dropdown-item" href="javascript:void(0)">1x</a></li>
                <li><a class="dropdown-item" href="javascript:void(0)">1.25x</a></li>
                <li><a class="dropdown-item" href="javascript:void(0)">1.5x</a></li>
              </ul>
            </div>
          </div>
          <!-- -->
          <div class="chatInterface-content">
<%--            <div class="chatInterface-frame left">
              <div class="avatar"> <span class="avatar-img"><img src="Content/images/TEEMI-Bot/avatar.png" alt="機器人頭像"></span></div>
              <div class="dialog">
                <div class="dialog-tools">
                  <button type="button" class="btn btn-link btn__translate" aria-expanded="false" aria-label="顯示翻譯" title="顯示翻譯" onClick="TRANSLATE(this)"> </button>
                  <button type="button" class="btn btn-link btn__screenText" aria-expanded="true" aria-label="隱藏機器人說的話" title="隱藏機器人說的話" onClick="SCREENTEXT(this)"></button>
                </div>
                <div class="dialog-text">
                  <button type="button" class="btn btn-link btn__playTitle" title="播放" onClick="PLAYTITLE(this, 'Content/temp/Hi, what’s your name_.mp3')"><span class="visually-hidden">播放</span></button>
                  <div class="dialog-text-content">Hi, what’s your name? Hi, what’s your name?Hi, what’s your name?Hi, what’s your name?Hi, what’s your name?Hi, what’s your name?Hi, what’s your name?Hi, what’s your name?Hi, what’s your name?Hi, what’s your name?Hi, what’s your name?Hi, what’s your name?Hi, what’s your name?Hi, what’s your name?Hi, what’s your name?Hi, what’s your name?Hi, what’s your name?</div>
                </div>
                <div class="dialog-translate" style="display: none;">你叫甚麼名字？</div>
              </div>
            </div>
            <div class="chatInterface-frame right">
              <div class="avatar"><span class="avatar-text">陳</span></div>
              <div class="dialog">
                <div class="dialog-tools">
				  <button type="button" class="btn btn-link btn__suggest" aria-expanded="true" aria-label="隱藏可以這麼說" title="隱藏可以這麼說" onClick="SUGGEST(this)"></button>	
                  <button type="button" class="btn btn-link btn__screenText" aria-expanded="true" aria-label="隱藏我說的話" title="隱藏我說的話" onClick="SCREENTEXT(this)"></button>
                </div>
                <div class="dialog-text">
				  <button type="button" class="btn btn-link btn__playTitle" title="播放" onClick="PLAYTITLE(this, 'Content/temp/Hi, what’s your name_.mp3')"><span class="visually-hidden">播放</span></button>
                  <div class="dialog-text-content">Name is the Janie.</div>
                </div>
                <div class="dialog-suggest">
                  <div>可以這麼說</div>
                  <button type="button" class="btn btn-link btn__playTitle" title="播放" onClick="PLAYTITLE(this, 'Content/temp/My name is Janie..mp3')"><span class="visually-hidden">播放</span></button>
                  <span>My name is Janie.</span>
                </div>
              </div>
            </div>
            <div class="chatInterface-frame left">
              <div class="avatar"> <span class="avatar-img"><img src="Content/images/TEEMI-Bot/avatar.png" alt="機器人頭像"></span></div>
              <div class="dialog">
                <div class="dialog-tools">
                  <button type="button" class="btn btn-link btn__translate" aria-expanded="false" aria-label="顯示翻譯" title="顯示翻譯" onClick="TRANSLATE(this)"> </button>
                  <button type="button" class="btn btn-link btn__screenText" aria-expanded="true" aria-label="隱藏機器人說的話" title="隱藏機器人說的話" onClick="SCREENTEXT(this)"></button>
                </div>
                <div class="dialog-text">
                  <button type="button" class="btn btn-link btn__playTitle" title="播放" onClick="PLAYTITLE(this, 'Content/temp/Do you live in a dorm, Janie_.mp3')"><span class="visually-hidden">播放</span></button>
                  <div class="dialog-text-content">Do you live in a dorm, Janie?</div>
                </div>
                <div class="dialog-translate" style="display: none;">珍妮，你住在宿舍嗎？</div>
              </div>
            </div>
            <div class="chatInterface-frame right">
              <div class="avatar"><span class="avatar-text">陳</span></div>
              <div class="dialog">
                <div class="dialog-tools">
				  <button type="button" class="btn btn-link btn__suggest" aria-expanded="true" aria-label="隱藏可以這麼說" title="隱藏可以這麼說" onClick="SUGGEST(this)"></button>		
                  <button type="button" class="btn btn-link btn__screenText" aria-expanded="true" aria-label="隱藏我說的話" title="隱藏我說的話" onClick="SCREENTEXT(this)"></button>
                </div>
                <div class="dialog-text">
                  <div class="dialog-text-content">Name is the Janie.</div>
                </div>
                <div class="dialog-suggest" style="display: none;">
                  <button type="button" class="btn btn-link btn__suggest" aria-expanded="true" aria-label="隱藏可以這麼說" title="隱藏可以這麼說" onClick="SUGGEST(this)"></button>
                  <div>可以這麼說</div>
                  <button type="button" class="btn btn-link btn__playTitle" title="播放" onClick=""><span class="visually-hidden">播放</span></button>
                  <span></span>
                </div>
              </div>
            </div>
            <div class="chatInterface-frame left">
              <div class="avatar"> <span class="avatar-img"><img src="Content/images/TEEMI-Bot/avatar.png" alt="機器人頭像"></span></div>
              <div class="dialog">
                <div class="dialog-tools">
                  <button type="button" class="btn btn-link btn__translate" aria-expanded="false" aria-label="顯示翻譯" title="顯示翻譯" onClick="TRANSLATE(this)"> </button>
                  <button type="button" class="btn btn-link btn__screenText" aria-expanded="true" aria-label="隱藏機器人說的話" title="隱藏機器人說的話" onClick="SCREENTEXT(this)"></button>
                </div>
                <div class="dialog-text">
                  <button type="button" class="btn btn-link btn__playTitle" title="播放" onClick="PLAYTITLE(this, 'Content/temp/Hi, what’s your name_.mp3')"><span class="visually-hidden">播放</span></button>
                  <div class="dialog-text-content">Hi, what’s your name? Hi, what’s your name?Hi, what’s your name?Hi, what’s your name?Hi, what’s your name?Hi, what’s your name?Hi, what’s your name?Hi, what’s your name?Hi, what’s your name?Hi, what’s your name?Hi, what’s your name?Hi, what’s your name?Hi, what’s your name?Hi, what’s your name?Hi, what’s your name?Hi, what’s your name?Hi, what’s your name?</div>
                </div>
                <div class="dialog-translate" style="display: none;">你叫甚麼名字？</div>
              </div>
            </div>--%>
          </div>
          <!-- -->
          <div class="chatInterface-footer">
			<div class="btn btn-primary btn-sm btn__end btn-empty"></div>
            <button id="recordButton" type="button" class="btn btn-primary btn-lg btn__record" title="<%= Resources.Global.ChatSession3 %>"><i class="fa-solid fa-microphone fa-1x" aria-hidden="true"></i></button>
			<a href="chatEnd.html" type="button" class="btn btn-primary btn-sm btn__end" title="<%= Resources.Global.ChatSession5 %>" id="chatEndButton"><i class="fa-solid fa-arrow-right-from-bracket" aria-hidden="true"></i></a>  
          </div>
          <!-- --> 
        </div>
      </div>
    </div>
    <!-- futuristic-frame END --> 
  </div>

    <input type="hidden" id="culture"           name="culture"           value="<%= System.Threading.Thread.CurrentThread.CurrentUICulture.Name %>">
    <input type="hidden" id="userName"          name="userName"          value="<%: Session["ChatSession.UserName"] %>">
    <input type="hidden" id="topicId"           name="topicId"           value="<%: Session["ChatSession.TopicId"] %>">
    <input type="hidden" id="englishLevel"      name="englishLevel"      value="<%: Session["ChatSession.EnglishLevel"] %>">
    <input type="hidden" id="professionalLevel" name="professionalLevel" value="<%: Session["ChatSession.ProfessionalLevel"] %>">
    <input type="hidden" id="userMaxTurns"      name="userMaxTurns"      value="<%: Session["ChatSession.UserMaxTurns"] %>">

    <audio id="responseAudio"></audio>

</main>

<!-- ------- ------- ------- ------- ------- ------- ------- --> 
<!-- ------- ------- ------- ------- ------- ------- ------- --> 
<!-- ------- ------- ------- ------- ------- ------- ------- --> 
<!-- JavaScript Libraries --> 
<script src="Content/js/jquery-3.6.0.min.js"></script> 
<script src="Content/js/bootstrap.bundle.min.js"></script> 
<script src="Content/widgets/WOW-master/dist/wow.min.js"></script> 

<!-- MathJax -->
<script src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js"></script>

<!-- This web Javascript --> 
<script src="Content/js/main.js"></script> 
<script>
    const localized = {
        startRecording:         "<%= Resources.Global.ChatSession3 %>",
        stopRecording:          "<%= Resources.Global.ChatSession4 %>",
        showTranslation:        "<%= Resources.Global.ChatSession6 %>",
        hideTranslation:        "<%= Resources.Global.ChatSession7 %>",
        showChatbotTranscript:  "<%= Resources.Global.ChatSession8 %>",
        hideChatbotTranscript:  "<%= Resources.Global.ChatSession9 %>",
        showRecommendation:     "<%= HttpUtility.JavaScriptStringEncode(Resources.Global.ChatSession10) %>",
        hideRecommendation:     "<%= HttpUtility.JavaScriptStringEncode(Resources.Global.ChatSession11) %>",
        hideRecommendationHtml: "<%= HttpUtility.HtmlAttributeEncode(Resources.Global.ChatSession11) %>",
        showMyTranscript:       "<%= Resources.Global.ChatSession12 %>",
        hideMyTranscript:       "<%= Resources.Global.ChatSession13 %>",
        recommendation:         "<%= Resources.Global.ChatSession14 %>",
        playAudio:              "<%= Resources.Global.ChatSession15 %>",
        modalText:              "<%= Resources.Global.ChatSession16 %>",
        modalButton1:           "<%= Resources.Global.ChatSession17 %>",
        modalButton2:           "<%= Resources.Global.ChatSession18 %>"
   };

    //翻譯
    function TRANSLATE(button) {
        // 判斷目前的按鈕狀態
        const currentState = $(button).attr('aria-expanded') === 'true';
        // 選取當前的翻譯顯示區塊
        const translateTarget = $(button).parents('.dialog').find('.dialog-translate');

        if (!currentState) {
            // 當前狀態為 false：顯示翻譯
            $(button).attr('aria-expanded', 'true');
            translateTarget.show();

            // 更新按鈕的屬性（隱藏翻譯）
            $(button).attr({
                'aria-label': localized.hideTranslation,
                'title': localized.hideTranslation
            });
        } else {
            // 當前狀態為 true：隱藏翻譯
            $(button).attr('aria-expanded', 'false');
            translateTarget.hide();

            // 更新按鈕的屬性（顯示翻譯）
            $(button).attr({
                'aria-label': localized.showTranslation,
                'title': localized.showTranslation
            });
        }
    }

    //[眼睛] 機器人/我說的話
    function SCREENTEXT(button) {
        // 判斷目前的按鈕狀態
        const currentState = $(button).attr('aria-expanded');
        // 選取當前的文字區塊
        const content = $(button).parents('.dialog').find('.dialog-text-content');

        if (currentState === 'true') {
            // 目前是打開狀態，要關閉
            $(button).attr('aria-expanded', 'false');
            content.css('color', 'transparent');

            // 當 aria-expanded 設為 false（關閉）後，按鈕的提示應該是「顯示」而不是「隱藏」
            if ($(button).parents('.chatInterface-frame').hasClass('left')) {
                $(button).attr({
                    'aria-label': localized.showChatbotTranscript,
                    'title': localized.showChatbotTranscript
                });
            } else if ($(button).parents('.chatInterface-frame').hasClass('right')) {
                $(button).attr({
                    'aria-label': localized.showMyTranscript,
                    'title': localized.showMyTranscript
                });
            }

        } else {
            // 目前是關閉狀態，要打開
            $(button).attr('aria-expanded', 'true');
            content.css('color', '');

            if ($(button).parents('.chatInterface-frame').hasClass('left')) {
                $(button).attr({
                    'aria-label': localized.hideChatbotTranscript,
                    'title': localized.hideChatbotTranscript
                });
            } else if ($(button).parents('.chatInterface-frame').hasClass('right')) {
                $(button).attr({
                    'aria-label': localized.hideMyTranscript,
                    'title': localized.hideMyTranscript
                });
            }
        }
    }

    //[對話] 可以這麼說
    function SUGGEST(button) {
        // 判斷目前的按鈕狀態
        const currentState = $(button).attr('aria-expanded');
        // 選取當前要控制的文字區塊
        const content = $(button).parents('.dialog').find('.dialog-suggest');

        if (currentState === 'true') {
            // 現在是展開中 → 要收起
            $(button).attr('aria-expanded', 'false');
            content.addClass('hideText');

            $(button).attr({
                'aria-label': localized.showRecommendation,
                'title': localized.showRecommendation
            });
        } else {
            // 現在是收起中 → 要展開
            $(button).attr('aria-expanded', 'true');
            content.removeClass('hideText');

            $(button).attr({
                'aria-label': localized.hideRecommendation,
                'title': localized.hideRecommendation
            });
        }
    }

    //confirmModal 確認視窗 (無右上X，不可點黑處關閉)
    function confirmModalDOM(html) {
        $('body').append(`<div class="modal fade" id="confirmModal" tabindex="-1" aria-hidden="true" data-bs-backdrop="static" data-bs-keyboard="false">
                  <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                      <div class="modal-body pt-5">`
            + html
            + `<div class="text-center mt-4 mb-3">
                          <button type="button" class="btn btn-primary rounded-pill px-4 mx-2" data-bs-dismiss="modal">${localized.modalButton2}</button>
                          <button type="button" class="btn btn-primary rounded-pill px-4 mx-2" data-bs-dismiss="modal" id="OK">${localized.modalButton1}</button>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>`);
        var myModal = new bootstrap.Modal(document.getElementById('confirmModal'));
        myModal.show();

        const myModalEl = document.getElementById('confirmModal');
        myModalEl.addEventListener('hidden.bs.modal', event => {
            if (myModalEl.parentNode !== null) {
                myModalEl.parentNode.removeChild(myModalEl);
            }
        })
    }

    function showCommentModal(ms, text) {
        $('body').append(`
<div class="modal fade loading-bot-modal" id="loadingBotModal" tabindex="-1" aria-hidden="true" data-bs-backdrop="static" data-bs-keyboard="false">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content bg-transparent border-0">
      <div class="modal-body text-center">
        <div class="spinner-bot" role="status">
          <svg version="1.1" id="TEEMI-Bot-tool" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px"
	 y="0px" viewBox="0 0 670 530" style="enable-background:new 0 0 670 530;" xml:space="preserve">
            <g id="dialogue">
              <path id="dialogueBg" class="st0" d="M586.4,13.8L586.4,13.8c-46.1,0.1-83.6,26.1-83.6,58.2s15.3,38.6,38.5,48.9
		c-0.7,1.6-1.5,3.2-2.4,4.8c-5.9,11.2-12.9,19.2-18.1,24.3c7.4,0,20.8-0.8,35.3-8.1c7.8-3.9,13.6-8.6,17.9-12.5
		c4,0.4,8.2,0.6,12.4,0.6c46.2,0,83.6-26,83.6-58.1S632.6,13.8,586.4,13.8L586.4,13.8z"/>
              <path id="gear2" class="st1" d="M634.9,100.2c-1-1.2-2.3-2.2-3.5-3.1c-0.2-0.2-0.5-0.4-0.5-0.7v-0.9c0.2-0.6,0.2-1.2,0.2-1.8v-1.8
		c0-1.2-0.3-2.4-0.6-3.5c0-0.7,0-1.4,0.5-1.8c1.1-1,2.1-2.1,3.1-3.3c0.5-0.5,0.5-1.4,0-2.2l-0.7-1.2c-0.3-0.4-0.5-0.7-0.8-1.1
		c-0.2-0.4-0.6-0.6-0.9-0.8h-1c-1.5,0.4-3,0.8-4.4,1.5s-1.3,0.2-1.8-0.2c-0.9-0.7-1.9-1.4-3-1.9c-0.5-0.2-1-0.5-1.6-0.7
		s-1.1-0.5-1.7-0.5c-0.3,0-0.6-0.3-0.8-0.5c-0.3-0.2-0.5-0.5-0.5-0.8c-0.3-1.4-0.8-2.9-1.3-4.3c-0.2-0.6-1-1-1.9-1h-2.8
		c-0.9,0.2-1.6,0.6-1.8,1.3c-0.4,1.6-0.7,3.1-0.9,4.6c0,0.6-0.5,1.2-1.1,1.4l-1.6,0.8l-1.5,0.9l-1.4,1.1l-1.3,1.2
		c-0.5,0.5-1.2,0.7-1.8,0.5c-1.4-0.5-2.9-0.9-4.4-1.1c-0.7,0-1.4,0.3-1.9,1.1c-0.5,0.7-0.8,1.6-1.2,2.4s-0.3,1.7,0.2,2.2
		c1,1.2,2.3,2.2,3.5,3.1c0.2,0.2,0.5,0.4,0.5,0.7v0.9c-0.2,0.6-0.2,1.2-0.2,1.8v1.8c0,1.2,0.3,2.4,0.6,3.5c0,0.7,0,1.4-0.5,1.8
		c-1.1,1-2.1,2.1-3.1,3.3c-0.5,0.5-0.5,1.4,0,2.2l0.7,1.2c0.3,0.4,0.5,0.7,0.8,1.1c0.2,0.4,0.6,0.6,0.9,0.8h1c1.5-0.4,3-0.8,4.4-1.5
		s1.3-0.2,1.8,0.2c0.9,0.7,1.9,1.4,3,1.9c0.5,0.2,1,0.5,1.6,0.7s1.1,0.5,1.7,0.5c0.3,0,0.6,0.3,0.8,0.5c0.3,0.2,0.5,0.5,0.5,0.8
		c0.3,1.4,0.8,2.9,1.3,4.3c0.2,0.6,1,1,1.9,1h2.8c0.9-0.2,1.6-0.6,1.8-1.3c0.4-1.6,0.7-3.1,0.9-4.6c0-0.6,0.5-1.2,1.1-1.4l1.6-0.8
		l1.5-0.9l1.4-1.1l1.3-1.2c0.5-0.5,1.2-0.7,1.8-0.5c1.4,0.5,2.9,0.9,4.4,1.1c0.7,0,1.4-0.3,1.9-1.1c0.5-0.7,0.8-1.6,1.2-2.4
		C635.5,101.6,635.4,100.7,634.9,100.2z M621.6,96.6c0,0.2-0.2,0.3-0.2,0.5c0,0.2-0.2,0.3-0.3,0.5c0,0.2-0.2,0.3-0.3,0.5
		c-0.2,0.3-0.4,0.6-0.7,0.9c-0.5,0.6-1.1,1-1.7,1.5c-0.7,0.4-1.3,0.8-2,1c-0.3,0.2-0.7,0.2-1.1,0.3h-4.4l-0.5-0.3
		c-0.2,0-0.3-0.2-0.5-0.2s-0.3-0.2-0.5-0.3c-0.2,0-0.3-0.2-0.5-0.3c-0.3-0.2-0.6-0.4-0.9-0.7c-0.6-0.5-1-1.1-1.5-1.7
		c-0.4-0.7-0.8-1.3-1-2c-0.2-0.3-0.2-0.7-0.3-1.1v-4.8l0.3-0.5c0-0.2,0.2-0.3,0.2-0.5c0-0.2,0.2-0.3,0.3-0.5c0-0.2,0.2-0.3,0.3-0.5
		c0.2-0.3,0.4-0.6,0.7-0.9c0.5-0.6,1.1-1,1.7-1.5c0.7-0.4,1.3-0.8,2-1c0.3-0.2,0.7-0.2,1.1-0.3h4.3l0.5,0.3c0.2,0,0.3,0.2,0.5,0.2
		s0.3,0.2,0.5,0.3c0.2,0,0.3,0.2,0.5,0.3c0.3,0.2,0.6,0.4,0.9,0.7c0.6,0.5,1,1.1,1.5,1.7c0.4,0.7,0.8,1.3,1,2
		c0.2,0.3,0.2,0.7,0.3,1.1v1.2h0.1v3.6h0L621.6,96.6z"/>
              <path id="gear1" class="st1" d="M600.6,55L600.6,55c-0.2-0.7-0.7-1.3-1.3-1.3c-1.4-0.3-2.8-0.5-4.2-0.5c-0.6,0-1.1-0.5-1.3-1
		c-0.3-1.1-0.8-2-1.3-3c-0.2-0.2-0.4-0.5-0.4-0.7l-0.4-0.7l-0.9-1.4c-0.3-0.5-0.3-1.1,0-1.6c0.8-1.1,1.4-2.4,2.1-3.6
		c0.3-0.6,0.2-1.3-0.3-1.8l-1.5-1.6c-0.5-0.4-1.3-0.6-1.8-0.4c-1.3,0.6-2.6,1.2-3.8,1.9c-0.5,0.4-1.1,0.3-1.6,0
		c-0.4-0.3-0.8-0.6-1.3-0.9l-1.4-0.8c-0.9-0.5-1.9-0.9-2.9-1.4c-0.5-0.3-0.9,0-0.9-1.4c0-1.4-0.2-2.7-0.2-4.1c0-1.4-0.5-1.2-1.2-1.4
		l-2.1-0.5c-0.7-0.2-1.4,0.1-1.7,0.6c-0.8,1.2-1.5,2.5-2.2,3.7c-0.3,0.6-0.8,0.8-1.4,0.8h-3.2c-1.1,0-2.2,0.2-3.2,0.4
		c-0.6,0.1-1.2-0.2-1.5-0.7c-0.7-1.1-1.5-2.2-2.4-3.3c-0.4-0.5-1.1-0.7-1.8-0.5c-0.7,0.3-1.4,0.5-2.1,0.8c-0.6,0.3-1.1-0.1-1.1,1.4
		s0.2,2.9,0.2,4.3c0,1.4-0.3,1.1-0.8,1.4l-1.4,0.9c-0.4,0.3-0.9,0.5-1.3,0.9c-0.9,0.6-1.7,1.2-2.5,2c-0.4,0.3-1.1,0.5-1.6,0.3
		c-1.2-0.6-2.5-1-3.8-1.5c-0.6-0.2-1.3,0.1-1.8,0.6s-0.9,1.1-1.3,1.7c-0.4,0.6-0.5,1.3-0.2,1.8c0.8,1.2,1.6,2.4,2.5,3.5
		c0.3,0.5,0.4,1.1,0.1,1.6c-0.5,1-0.9,2-1.4,3c-0.3,1.1-0.7,2.1-1,3.1c0,0.6-0.6,1.1-1.2,1.1c-1.4,0.2-2.7,0.5-4.1,0.8
		c-0.6,0.1-1.1,0.7-1.1,1.4c0,0.7-0.2,1.5-0.2,2.2c0,0.7,0.4,1.4,0.9,1.6c1.3,0.6,2.5,1.1,3.9,1.6c0.6,0.2,1,0.7,1,1.3
		c0.1,1.1,0.3,2.1,0.5,3.2c0.1,0.6,0.3,1.1,0.4,1.6l0.4,1.5c0.2,0.6,0.1,1.2-0.4,1.6c-1,0.9-2,1.9-3,2.9c-0.5,0.4-0.5,1.2-0.2,1.8
		c0.3,0.6,0.6,1.3,1,1.9c0.4,0.6,1,0.9,1.6,0.9c1.4,0,2.8-0.4,4.2-0.7c0.5-0.2,1.1,0,1.5,0.5c0.3,0.5,0.6,0.9,1,1.3l1.1,1.2l0.5,0.6
		l0.6,0.5l1.2,1.1c0.5,0.4,0.7,1,0.5,1.6c-0.4,1.3-0.7,2.6-1,4c-0.2,0.3,0,0.6,0,0.9c0.2,0.3,0.4,0.5,0.7,0.7l1.9,1.1
		c0.6,0.5,1.3,0.4,1.8,0c1.1-0.9,2.1-1.9,3.1-2.9c0.4-0.4,1.1-0.6,1.6-0.4c1,0.3,2,0.7,3.1,0.9l1.6,0.3c0.5,0.2,1.1,0.2,1.6,0.2
		c0.6,0,1.1,0.5,1.3,1.1c0.4,1.3,0.9,2.6,1.4,3.9c0.2,0.6,0.9,1,1.6,1c0.7-0.2,1.5-0.2,2.2-0.2s1.3-0.5,1.5-1.1
		c0.4-1.4,0.7-2.8,1-4.2c0-0.5,0.5-0.9,1.1-1.1l1.6-0.4l0.8-0.2c0.3,0,0.6-0.3,0.8-0.3c1-0.4,2.1-0.8,3-1.3c0.5-0.3,1.1-0.2,1.6,0.2
		c1.1,0.9,2.2,1.7,3.3,2.5c0.4,0.4,1.2,0.4,1.8,0c0.7-0.4,1.2-0.9,1.8-1.3c0.7-0.5,0.9-1.1,0.7-1.7c-0.4-1.4-0.9-2.8-1.4-4.1
		c-0.2-0.6-0.1-1.2,0.3-1.6c0.7-0.9,1.5-1.6,2.1-2.5l0.9-1.3l0.3-0.4l0.4-0.7c0.3-0.5,0.9-0.7,1.5-0.7c0.7,0.2,1.4,0.2,2.1,0.2h2.1
		c0.6,0,1.2-0.4,1.5-1.1l0.4-1c0.2-0.3,0.4-0.7,0.4-1c0.2-0.7,0-1.4-0.4-1.8c-0.5-0.5-1.1-0.9-1.6-1.4c-0.5-0.4-1.1-0.9-1.7-1.3
		c-0.6-0.3-0.6-0.9-0.6-1.5l0.3-0.8V67l0.2-1.6v-3.2c-0.1-0.6,0.3-1.1,0.8-1.4c1.2-0.6,2.5-1.2,3.7-1.9c0.7-0.3,0.7-1,0.7-1.7
		C600.9,56.4,600.8,55.7,600.6,55z M584.1,64L584.1,64c0,1.6-0.6,3.2-1.1,4.8c-0.6,1.5-1.4,3-2.4,4.3c-2,2.7-4.8,4.7-7.9,5.8
		c-1.5,0.5-3.2,1-4.8,1s-3.3,0-4.9-0.5h-0.6c-0.2-0.2-0.4-0.2-0.6-0.2l-1.2-0.4l-1.1-0.5c-0.2,0-0.4-0.3-0.6-0.3l-0.5-0.3
		c-1.4-0.8-2.7-1.8-3.9-3c-2.3-2.3-3.9-5.4-4.6-8.6l-0.3-1.2v-3.6c0-1.6,0.6-3.2,1.1-4.8c0.6-1.5,1.4-3,2.4-4.3
		c0.2-0.4,0.5-0.7,0.8-1s0.6-0.6,0.9-0.9l0.9-0.8l1-0.8c2.7-1.9,5.9-3.1,9.2-3.3c1.6,0,3.3,0,4.9,0.6h0.6c0.2,0.2,0.4,0.2,0.6,0.2
		l1.2,0.4l1.1,0.5c0.2,0.1,0.4,0.3,0.6,0.3l0.5,0.3c1.5,0.8,2.7,1.8,3.9,3s2,2.5,2.8,3.8C583.7,57.4,584.4,60.7,584.1,64z"/>
            </g>
            <path id="foot" class="st2" d="M354.8,496.9c0,0,29.6-0.2,58-1.9c-11.6,11.6-38.1,35.4-60.1,34.9c-20.9-0.4-45.8-22.6-58.3-35.1
	C323.6,496.6,354.8,496.8,354.8,496.9L354.8,496.9L354.8,496.9z"/>
            <g id="body">
              <path id="bodyShadow" class="st2" d="M377.7,452.5c-46.8,5.1-117.2-7.5-162.2-34.8c-14.8-8.5-27.1-17.7-35.6-26.3
		c-14.1-14.5-22.6-38.1-27.6-58.6c0,5,0.2,9.7,0.5,13.7c1.6,18,8.5,57.7,27.5,78.6c7.1,7.6,17.3,15.8,29.5,23.5
		c37.4,24.7,95.8,39,135.2,38h0.4c38.9,0.5,95.6-13.6,132.6-37.9c12.9-8,23.6-16.6,30.9-24.5c7.1-7.6,12.4-16.8,16.5-26.6
		c-41.8,30.9-103.6,51.8-147.3,54.9L377.7,452.5L377.7,452.5L377.7,452.5z"/>
              <path id="bodyMain" class="st3" d="M536.6,345.7v-3.6c0.2-17.5,4.1-135.8-8.7-159.1c-4-5.6-8.8-10.9-14.3-15.6
		c-3.2-2.7-6.6-5.3-10.2-7.6c-26-16.3-62.2-24.8-94.9-28.6c-1.7-0.2-3.4-0.4-5.1-0.6c-18.5-1.9-35.6-2.4-49-2.5h-26.1
		c-38.2,0-106.6,4.9-148.8,31.4c-45,27.2-24.8,143.1-26,152.4c-0.9,7-1.2,14.2-1.2,20.8c5,20.5,13.5,44.1,27.6,58.6
		c8.5,8.6,20.8,17.8,35.5,26.3c45,27.4,115.4,40,162.2,34.8h0.5c43.8-3.1,105.5-24,147.3-54.9c3.5-8.5,6.1-17.5,7.9-26.5
		c1.7-8.6,2.9-17.2,3.2-25.5l0,0L536.6,345.7L536.6,345.7L536.6,345.7z"/>
            </g>
            <g id="tele">
              <path id="tube" class="st2" d="M409.9,78.8c-6.6,0.2-11.9,5.8-11.7,12.5c0.2,4.8,3.1,8.9,7.2,10.7l-3.7,28.2
		c-0.2,1.5,0.8,2.8,2.3,3h0.4c1.3,0,2.5-1,2.7-2.3l3.7-27.9l0,0c3.2,0,6.2-1.5,8.4-3.9c2.1-2.2,3.2-5.2,3.2-8.3v-0.4
		c-0.1-3.2-1.5-6.2-3.8-8.4C416.2,79.8,413.1,78.7,409.9,78.8L409.9,78.8L409.9,78.8z"/>
              <path id="leftWave1" class="st2" d="M441.9,71.7c-1.4-0.6-3,0-3.5,1.4c-0.6,1.4,0,3,1.4,3.5c2.3,1,4.2,3.3,5,6.2
		c1,3.4,0.2,7-2,10.2c-0.9,1.2-0.5,2.9,0.7,3.7c0.5,0.3,1,0.5,1.5,0.5c0.9,0,1.7-0.4,2.2-1.2c3.1-4.6,4.1-9.8,2.7-14.7
		C448.7,77,445.7,73.4,441.9,71.7L441.9,71.7L441.9,71.7z"/>
              <path id="leftWave2" class="st2" d="M470.2,75.2c-1.8-6.6-6.4-12-12.1-14.5c-1.4-0.6-3,0-3.5,1.4c-0.6,1.4,0,3,1.4,3.5
		c4.3,1.9,7.6,6,9.1,11.1c1.7,6,0.5,12.4-3.5,18c-0.9,1.2-0.5,2.9,0.7,3.8c0.5,0.3,1,0.5,1.5,0.5c0.9,0,1.7-0.4,2.2-1.2
		c4.8-7,6.3-14.9,4.2-22.5l0,0L470.2,75.2z"/>
              <path id="rightWave1" class="st2" d="M377.5,63.3c-4,1-7.6,4-9.6,8c-2.2,4.6-2.2,10,0.1,15c0.5,1,1.4,1.6,2.5,1.6s0.8,0,1.1-0.2
		c1.4-0.6,2-2.2,1.3-3.6c-1.6-3.6-1.7-7.3-0.1-10.4c1.3-2.6,3.5-4.5,6-5.2c1.4-0.3,2.3-1.8,2-3.2C380.4,63.9,379,63,377.5,63.3
		L377.5,63.3L377.5,63.3z"/>
              <path id="rightWave2" class="st2" d="M366.6,51.6c-0.4-1.4-1.8-2.3-3.3-2c-6.1,1.5-11.5,6.1-14.4,12.2c-3.4,7-3.3,15.2,0.2,22.9
		c0.5,1,1.4,1.6,2.5,1.6s0.8,0,1.1-0.2c1.4-0.6,1.9-2.2,1.3-3.6c-2.9-6.2-2.9-12.7-0.2-18.3c2.3-4.7,6.3-8.2,10.9-9.3
		c1.4-0.4,2.3-1.8,2-3.3H366.6z"/>
            </g>
            <g id="head">
              <path id="face" class="st1" d="M463.4,302.6c-28.1,11.5-81.8,11.5-124.5,11.5s-96.4,0-124.5-11.5s-39.7-82.1-27-105.7
		c12.8-23.5,85.6-39.5,151.4-39.5s138.7,15.9,151.4,39.5c12.8,23.6,1.1,94.2-27,105.7H463.4z"/>
              <path id="mouth" class="st2" d="M370.3,228.1l-63.4,6.5c-7.9,0.8-13,9-9.9,16.3c20,46.7,72.1,45.3,85.9-7.7
		c2.1-8.1-4.4-15.9-12.7-15.1H370.3z"/>
              <path id="rightEye" class="st2" d="M276,201.1c0,6.2-5.1,11.3-11.3,11.3s-11.3-5.1-11.3-11.3s5.1-11.3,11.3-11.3
		S276,194.9,276,201.1z"/>
              <circle id="leftEye" class="st2" cx="424.8" cy="201.1" r="11.3"/>
            </g>
            <path id="leftHand" class="st3" d="M500,273c11.8,1.4,23.5,1.2,34.7,0.2c40.2-3.8,74.7-19.4,89-19c0.5,0,1,0,1.5,0.1
	c0.3,0,0.6,0,0.9,0.1c0.3,0,0.6,0.1,0.9,0.2l0,0c0.4,0.1,0.8,0.3,1.1,0.5c12.1,7.4,12.1,28.8-36.8,69.4c-10.1,8.4-20,15.2-29.5,20.8
	c-23.5,13.9-54.3,2.1-61.1-24.4c-3.4-13.1-4.5-29.2-0.7-48.1l0,0L500,273L500,273L500,273z"/>
            <path id="rightHand" class="st3" d="M210.1,341.5c-12.6,1.7-24.6,5-35.9,9.1c-40.5,14.7-71.9,40.1-86.8,43.6
	c-0.5,0.1-1.1,0.2-1.5,0.3c-0.3,0-0.6,0.1-0.9,0h-1c-0.5,0-0.9-0.1-1.3-0.2c-14.5-4.4-20.3-26.5,19.4-81.6
	c8.1-11.3,16.6-21.1,24.9-29.5c20.5-20.7,55.5-16.7,69.6,8.8c7,12.6,12.5,28.9,13.6,49.4l0,0L210.1,341.5z"/>
            <path id="screwdriver" class="st0" d="M660.9,334c-10.8-31.4-24.1-65-35.9-95.9l0,0c14.5-10.2,15.2-34.4,0.8-45.4l-10.2,3.4
	l5.2,15.6l-9.8,14.2l-16.4-5.5l-5.2-15.6l-10.2,3.4c-5.2,18.4,11.8,37.9,30.4,35.7c9,30.1,20.1,67,29.9,97.2c4,15.2,27,7.5,21.2-7
	L660.9,334L660.9,334z M649,333.2c5.6-1.9,8.5,6.9,2.9,8.7C646.3,343.9,643.3,335,649,333.2z"/>
            <path id="leftHand2" class="st3" d="M616,253.4c4.5,7.7,3.4,16.7-2.3,20s-14-0.3-18.5-8s-3.4-16.7,2.3-20S611.5,245.7,616,253.4z"/>
          </svg>
		  </div>
          <div class="spinner-text">` + text + `</div>  
      </div>
    </div>
  </div>
</div>
  `);
        var myModal = new bootstrap.Modal(document.getElementById('loadingBotModal'));
        myModal.show();

        //var timeout = setTimeout(function () {
        //    myModal.hide();
        //}, ms);

        $('#loadingBotModal').on('hidden.bs.modal', function () {
            $(this).remove();
        });
    }

    function hideCommentModal() {
        var modalEl = document.getElementById("loadingBotModal");
        if (modalEl) {
            var modal = bootstrap.Modal.getInstance(modalEl);
            if (modal) {
                modal.hide();
            }
        }
    }
</script>
    <script>
        $(document).ready(function () {
            let culture = $("#culture").val();
            let sessionId = null;
            let mediaRecorder;
            let audioChunks = [];
            let chatbotAudioResponses = [];
            let userAudios = [];
            let userAudioResponses = [];
            let userName = $("#userName").val();
            let userMaxTurns = $("#userMaxTurns").val();
            let chatbotTurns = 0;
            let userTurns = 0;
            let intervalID;

            function initHtml() {
                var langMap = {
                    "en-US": "en",
                    "zh-CN": "zh-Hans-CN",
                    "zh-TW": "zh-Hant-TW",
                    "id-ID": "id",
                    "vi-VN": "vi"
                };

                var langValue = langMap[culture] || "en";

                $("html").attr("lang", langValue);
            }


            let audioContext;
            let processor;
            let input;
            let stream;
            let audioData = [];

            async function startRecording() {
                audioData = [];
                stream = await navigator.mediaDevices.getUserMedia({ audio: true });
                audioContext = new AudioContext();
                const source = audioContext.createMediaStreamSource(stream);

                processor = audioContext.createScriptProcessor(4096, 1, 1);

                processor.onaudioprocess = function (e) {
                    const inputData = e.inputBuffer.getChannelData(0);
                    audioData.push(new Float32Array(inputData));
                };

                source.connect(processor);
                processor.connect(audioContext.destination);
            }

            function stopRecording() {
                processor.disconnect();
                stream.getTracks().forEach((track) => track.stop());
                return encodeWAV(audioData, audioContext.sampleRate);
            }

<%--
            let audioContext;
            let audioWorkletNode;
            let stream;
            let audioData = [];

            async function startRecording() {
                audioData = [];
                stream = await navigator.mediaDevices.getUserMedia({ audio: true });
                audioContext = new AudioContext();

                //await audioContext.audioWorklet.addModule('recorder-worklet-processor.js');
                await audioContext.audioWorklet.addModule('<%: ResolveUrl("~/Chatbot/Scripts/recorder-worklet-processor.js") %>');
                audioWorkletNode = new AudioWorkletNode(audioContext, 'recorder-worklet-processor');

                audioWorkletNode.port.onmessage = (event) => {
                    audioData.push(new Float32Array(event.data));
                };

                const source = audioContext.createMediaStreamSource(stream);
                source.connect(audioWorkletNode).connect(audioContext.destination);
            }

            function stopRecording() {
                if (audioWorkletNode) {
                    audioWorkletNode.disconnect();
                }
                if (audioContext && audioContext.state !== 'closed') {
                    audioContext.close();
                }
                if (stream) {
                    stream.getTracks().forEach((track) => track.stop());
                }
                return encodeWAV(audioData, audioContext.sampleRate);
            }
--%>
            function encodeWAV(samples, sampleRate) {
                const bufferLength = samples.reduce((sum, arr) => sum + arr.length, 0);
                const buffer = new ArrayBuffer(44 + bufferLength * 2);
                const view = new DataView(buffer);

                function writeString(view, offset, str) {
                    for (let i = 0; i < str.length; i++) {
                        view.setUint8(offset + i, str.charCodeAt(i));
                    }
                }

                // RIFF header
                writeString(view, 0, 'RIFF');
                view.setUint32(4, 36 + bufferLength * 2, true);
                writeString(view, 8, 'WAVE');
                writeString(view, 12, 'fmt ');
                view.setUint32(16, 16, true); // PCM
                view.setUint16(20, 1, true);  // Linear PCM
                view.setUint16(22, 1, true);  // Mono
                view.setUint32(24, sampleRate, true);
                view.setUint32(28, sampleRate * 2, true); // byte rate
                view.setUint16(32, 2, true); // block align
                view.setUint16(34, 16, true); // bits per sample
                writeString(view, 36, 'data');
                view.setUint32(40, bufferLength * 2, true);

                // PCM samples
                let offset = 44;
                for (const sample of samples) {
                    for (let i = 0; i < sample.length; i++) {
                        const s = Math.max(-1, Math.min(1, sample[i]));
                        view.setInt16(offset, s * 0x7FFF, true);
                        offset += 2;
                    }
                }

                return new Blob([view], { type: 'audio/wav' });
            }


            async function getSessionId() {
                let formData = new FormData();
                formData.append("topicId", $("#topicId").val());
                formData.append("englishLevel", $("#englishLevel").val());
                formData.append("professionalLevel", $("#professionalLevel").val());
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

            async function getTranslation(text) {
                let data = null;
                let formData = new FormData();
                formData.append("sessionId", sessionId);
                formData.append("text", text);
                formData.append("action", "getTranslation");

                try {
                    let response = await fetch("VoiceChatHandler.ashx", {
                        method: "POST",
                        body: formData
                    });

                    if (response.ok) {
                        data = await response.json();
                    }
                } catch (error) {
                    console.error("Error fetching translation:", error);
                }

                return data;
            }

            async function getRecommendation(text) {
                let data = null;
                let formData = new FormData();
                formData.append("sessionId", sessionId);
                formData.append("text", text);
                formData.append("action", "getRecommendation");

                try {
                    let response = await fetch("VoiceChatHandler.ashx", {
                        method: "POST",
                        body: formData
                    });

                    if (response.ok) {
                        data = await response.json();
                    }
                } catch (error) {
                    console.error("Error fetching recommendation:", error);
                }

                return data;
            }

            async function sendAudio(audioBlob, mimeType, audioIndex) {
                try {
                    // 顯示 loading 畫面
                    $('body').prepend(`
                      <div id="spinner" class="spinner show">
                        <div class="spinner-border" role="status">
                          <span class="visually-hidden-focusable">Loading...</span>
                        </div>
                      </div>
                    `);

                    if (sessionId == null) {
                        await getSessionId();
                        if (!sessionId) {
                            alert("Failed to retrieve session ID.");
                            return;
                        }
                    }

                    let formData = new FormData();
                    formData.append("audioFile", audioBlob, `recording.${mimeType.split("/")[1]}`); // "recording.webm"
                    formData.append("action", "getTranscription");

                    let response = await fetch("VoiceChatHandler.ashx", {
                        method: "POST",
                        body: formData
                    });

                    let raw = await response.text();
                    let data = null;
                    try {
                        data = JSON.parse(raw);
                    } catch {
                    }

                    if (!response.ok) {
                        let errText = data?.error || raw;
                        throw new Error(errText || "Unknown server error");
                    }

                    //let data = await response.json();
                    console.log("getTranscription: ", data.text);
                    console.log("getTranscription: ", data.recommendedText);

                    // 移除 loading 畫面
                    $('#spinner').remove();

                    let index = userAudioResponses.push(data.audioBase64) - 1;
                    appendToChatHistory(data.text, data.recommendedText, audioIndex, index, false);

                    let hasEnglish = /[a-zA-Z]/.test(data.text);
                    if (hasEnglish) {
                        getRecommendation(data.text).then(result => {
                            $(`#recommend-${index}`).text(result.recommendedText);
                            userAudioResponses[userAudioResponses.length - 1] = result.audioBase64;
                            if (data.text != result.recommendedText) {
                                // Show recommendation
                                $(`#recommend-${index}`).parent().removeAttr("style");
                            }
                        });
                    }

                    await chat(data.text);
                } catch (error) {
                    alert(`[ERROR] ${error.message}`);
                    console.error("Send audio error:", error);
                } finally {
                    // 移除 loading 畫面
                    $('#spinner').remove();
                }
            }

            async function chat(text) {
                try {
                    updateProgress(chatbotTurns);
                    if (chatbotTurns < userMaxTurns - 1) {
                        chatbotTurns++;
                    }

                    if (userTurns < userMaxTurns - 1) {
                        // 顯示 loading 畫面
                        $('body').prepend(`
                          <div id="spinner" class="spinner show">
                            <div class="spinner-border" role="status">
                              <span class="visually-hidden-focusable">Loading...</span>
                            </div>
                          </div>
                        `);
                    } else {
                        // 顯示 loading 畫面
                        //loadingBotDOM(5000, '評語產生中，請稍後');
                        showCommentModal(5000, '評語產生中，請稍後');
                    }

                    if (sessionId == null) {
                        await getSessionId();
                        if (!sessionId) {
                            alert("Failed to retrieve session ID.");
                            return;
                        }
                    }

                    let formData = new FormData();
                    formData.append("sessionId", sessionId);
                    //formData.append("topic", "English Grammar");
                    formData.append("text", text);
                    formData.append("action", "chat");

                    let response = await fetch("VoiceChatHandler.ashx", {
                        method: "POST",
                        body: formData
                    });

                    let raw = await response.text();
                    let data = null;
                    try {
                        data = JSON.parse(raw);
                    } catch {
                    }

                    if (!response.ok) {
                        let errText = data?.error || raw;
                        throw new Error(errText || "Unknown server error");
                    }

                    //let data = await response.json();
                    console.log("chat: ", data.text);
                    console.log("chat: ", data.translatedText);

                    if (userTurns < userMaxTurns - 1) {
                        // 移除 loading 畫面
                        $('#spinner').remove();
                    } else {
                        hideCommentModal();
                    }

                    let output = data.text.replace(/\n/g, "<br>");
                    let index = chatbotAudioResponses.push(data.audioBase64) - 1;
                    appendToChatHistory(output, data.translatedText, index, null, true);

                    // Render LaTeX
                    MathJax.typesetPromise();

                    if (culture !== "en-US") {
                        getTranslation(data.text).then(result => {
                            $(`#translate-${index}`).text(result.translatedText);

                            // Render LaTeX
                            MathJax.typesetPromise();
                        });
                    }

                    let audioElement = document.getElementById("responseAudio");
                    let audioSrc = "data:audio/aac;base64," + data.audioBase64; // audio/mpeg
                    audioElement.src = audioSrc;

                    let speedText = $(".btn__speed span").text().replace("x", "");
                    let speed = parseFloat(speedText);
                    audioElement.playbackRate = speed;

                    audioElement.play().catch(error => {
                        console.error("Autoplay failed. Please play the audio manually.", error);
                    });
                } catch (error) {
                    alert(`[ERROR] ${error.message}`);
                    console.error("Chat error:", error);
                } finally {
                    // 移除 loading 畫面
                    $('#spinner').remove();
                }
            }

            function updateProgress(n) {
                let progress = (n + 1) / userMaxTurns * 100;
                $("#progress").css("width", progress + "%");
                //$("#progress").text(String(n + 1) + " / " + String(userMaxTurns));
                $("#progressLabel").html(`<span>${String(n + 1)}</span>/<span>${String(userMaxTurns)}</span>`);
            }

            function appendToChatHistory(text1, text2, audioIndex1, audioIndex2, isChatbot) {
                //    let message = `
                //        <div class="chat-row ${isChatbot ? 'bot-message' : 'user-message'}">
                //            <div class="chat-bubble ${isChatbot ? 'bot-bubble' : 'user-bubble'}">${text}</div>
                //        </div>
                //    `;
                //    $("#chatHistory").append(message);

                if (isChatbot) {
                    let translateButton = "";

                    if (culture !== "en-US") {
                        translateButton = `<button type="button" class="btn btn-link btn__translate" aria-expanded="false" aria-label="${localized.showTranslation}" title="${localized.showTranslation}" onClick="TRANSLATE(this)"> </button>`;
                    }

                    $('.chatInterface-content').append(`
                         <div class="chatInterface-frame left">
                          <div class="avatar"> <span class="avatar-img"><img src="Content/images/TEEMI-Bot/avatar.png" alt="機器人頭像"></span></div>
                          <div class="dialog">
                            <div class="dialog-tools">
                              ${translateButton}
                              <button type="button" class="btn btn-link btn__screenText" aria-expanded="true" aria-label="${localized.hideChatbotTranscript}" title="${localized.hideChatbotTranscript}" onClick="SCREENTEXT(this)"></button>
                            </div>
                            <div class="dialog-text">
                              <button type="button" class="btn btn-link btn__playTitle play-audio" title="${localized.playAudio}" data-index="${audioIndex1}" data-audio-type="chatbot"><span class="visually-hidden">${localized.playAudio}</span></button>
                              <div class="dialog-text-content">${text1}</div>
                            </div>
                            <div id="translate-${audioIndex1}" class="dialog-translate" style="display: none;">...</div>
                          </div>
                        </div>
                    `);
                    //<div class="dialog-translate" style="display: none;">${text2}</div>
                } else {
                    $('.chatInterface-content').append(`
                        <div class="chatInterface-frame right">
                            <div class="avatar"><span class="avatar-text">${userName}</span></div>
                            <div class="dialog">
                                <div class="dialog-tools">
                                    <button type="button" class="btn btn-link btn__suggest" aria-expanded="true" aria-label="${localized.hideRecommendationHtml}" title="${localized.hideRecommendationHtml}" onClick="SUGGEST(this)"></button>
                                    <button type="button" class="btn btn-link btn__screenText" aria-expanded="true" aria-label="${localized.hideMyTranscript}" title="${localized.hideMyTranscript}" onClick="SCREENTEXT(this)"></button>
                                </div>
                                <div class="dialog-text">
                                    <button type="button" class="btn btn-link btn__playTitle play-audio" title="${localized.playAudio}" data-index="${audioIndex1}" data-audio-type="user"><span class="visually-hidden">${localized.playAudio}</span></button>
                                    <div class="dialog-text-content">${text1}</div>
                                </div>
                                <div class="dialog-suggest" style="display: none;">
                                    <div>${localized.recommendation}</div>
                                    <button type="button" class="btn btn-link btn__playTitle play-audio" title="${localized.playAudio}" data-index="${audioIndex2}" data-audio-type="recommended">
                                        <span class="visually-hidden">${localized.playAudio}</span>
                                    </button>
                                    <span id="recommend-${audioIndex2}">...</span>
                                </div>
                            </div>
                        </div>
                    `);
                    //<span>${text2}</span>
                }

                // 捲軸捲動至最底部
                $('.futuristic-frame-content').animate({
                    scrollTop: $('.futuristic-frame-content')[0].scrollHeight
                }, 500);
            }

            function startTimer() {
                const maxTick = 90;
                let second = 0;

                ////$("#timer").html(second + "s");

                //let progress = second / maxTick * 100;
                //$("#ticker1").html(second + "s");
                //$("#ticker2").css("stroke-dasharray", progress + " 100");

                intervalID = setInterval(function () {
                    second++;
                    ////$("#timer").html(second + "s");

                    //let progress = second / maxTick * 100;
                    //$("#ticker1").html(second + "s");
                    //$("#ticker2").css("stroke-dasharray", progress + " 100");

                    if (second > maxTick) {
                        let isRecording = $("#recordButton").attr("data-recording") === "true";
                        if (isRecording)
                            $("#recordButton").trigger("click"); // stop recording
                    }
                }, 1000);
            }

            function stopTimer() {
                clearInterval(intervalID);
                ////$("#timer").html("");
            }

            $("#start").click(function () {
                //$("#start").hide();
                $(".modal-start").hide();

                chat("[Greetings]");
            });

            $("#chatEnd, #chatEndButton").click(function (event) {
                event.preventDefault();

                confirmModalDOM(`<div class="text-center">${localized.modalText}</div>`);

                // 先移除舊的事件綁定，再重新綁定
                $("#OK").off("click").on("click", function () {
                    let topicId = $("#topicId").val();
                    let englishLevel = $("#englishLevel").val();
                    let professionalLevel = $("#professionalLevel").val();

                    //window.location.href = `ChatEnd.aspx?topicId=${topicId}&englishLevel=${encodeURIComponent(englishLevel)}&professionalLevel=${encodeURIComponent(professionalLevel)}&sessionId=${encodeURIComponent(sessionId)}`;
                    let form = $("<form>", {
                        action: "ChatEnd.aspx",
                        method: "POST"
                    });

                    form.append($("<input>", { type: "hidden", name: "topicId", value: topicId }));
                    form.append($("<input>", { type: "hidden", name: "englishLevel", value: englishLevel }));
                    form.append($("<input>", { type: "hidden", name: "professionalLevel", value: professionalLevel }));
                    form.append($("<input>", { type: "hidden", name: "sessionId", value: sessionId }));

                    $("body").append(form);
                    form.submit();
                });
            });

            $(".dropdown-item").click(function () {
                $(".btn__speed span").text($(this).text());
            });

            $("#recordButton").click(async function () {
                const ua = navigator.userAgent;
                const isWindows = ua.includes("Windows");
                const isEdge = ua.includes("Edg/");
                const isChrome = ua.includes("Chrome") && !ua.includes("Edg/") && !ua.includes("OPR");

                let isRecording = $(this).attr("data-recording") === "true";

                if (!isRecording) {
                    try {
                        if (isWindows && (isEdge || isChrome)) {
                            // Recording with MediaRecorder ("audio/webm" or "audio/mp4")
                            const stream = await navigator.mediaDevices.getUserMedia({ audio: true });
                            const mimeType = MediaRecorder.isTypeSupported("audio/webm")
                                ? "audio/webm"
                                : MediaRecorder.isTypeSupported("audio/mp4")
                                    ? "audio/mp4"
                                    : "";
                            if (!mimeType) {
                                alert("This browser does not support required audio format.");
                                return;
                            }
                            mediaRecorder = new MediaRecorder(stream, { mimeType });
                            audioChunks = [];

                            $(".play-audio").prop("disabled", true);

                            mediaRecorder.ondataavailable = event => {
                                audioChunks.push(event.data);
                            };

                            mediaRecorder.onstop = async () => {
                                const audioBlob = new Blob(audioChunks, { type: mimeType });
                                let index = userAudios.push(audioBlob) - 1;
                                await sendAudio(audioBlob, mimeType, index);
                                userTurns++;
                                $("#recordButton").prop("disabled", true);
                                $(".play-audio").prop("disabled", false);
                            };

                            mediaRecorder.start();

                            //$(this).text("Stop Recording").attr("data-recording", "true");
                            $(this).attr("data-recording", "true");
                            // 顯示錄製中效果
                            $(this).attr('title', localized.stopRecording); //更改title
                            $(this).addClass('active current'); //增加閃爍效果
                            $(this).html('<i class="fa-solid fa-stop" aria-hidden="true"></i>'); //更改按鈕狀態
                            startTimer();
                        } else {
                            // Recording with AudioWorklet ("audio/wav")
                            $(".play-audio").prop("disabled", true);
                            startRecording();

                            //$(this).text("Stop Recording").attr("data-recording", "true");
                            $(this).attr("data-recording", "true");
                            // 顯示錄製中效果
                            $(this).attr('title', localized.stopRecording); //更改title
                            $(this).addClass('active current'); //增加閃爍效果
                            $(this).html('<i class="fa-solid fa-stop" aria-hidden="true"></i>'); //更改按鈕狀態
                            startTimer();
                        }
                    } catch (error) {
                        alert("Unable to record. Please ensure microphone access is allowed in your browser.");
                    }
                } else {
                    if (isWindows && (isEdge || isChrome)) {
                        // Recording with MediaRecorder ("audio/webm" or "audio/mp4")
                        if (mediaRecorder && mediaRecorder.state !== "inactive") {
                            mediaRecorder.stop();
                        }

                        //$(this).text("Start Recording").attr("data-recording", "false");
                        $(this).attr("data-recording", "false");
                        // 停止錄音效果
                        $(this).attr('title', localized.startRecording); //更改title
                        $(this).removeClass('active current').blur(); //移除閃爍效果
                        $(this).html('<i class="fa-solid fa-microphone fa-1x" aria-hidden="true"></i>'); //更改按鈕狀態
                        stopTimer();
                    } else {
                        // Recording with AudioWorklet ("audio/wav")
                        const audioBlob = stopRecording();
                        const mimeType = "audio/wav";
                        let index = userAudios.push(audioBlob) - 1;

                        //$(this).text("Start Recording").attr("data-recording", "false");
                        $(this).attr("data-recording", "false");
                        // 停止錄音效果
                        $(this).attr('title', localized.startRecording); //更改title
                        $(this).removeClass('active current').blur(); //移除閃爍效果
                        $(this).html('<i class="fa-solid fa-microphone fa-1x" aria-hidden="true"></i>'); //更改按鈕狀態
                        stopTimer();

                        await sendAudio(audioBlob, mimeType, index);
                        userTurns++;
                        $("#recordButton").prop("disabled", true);
                        $(".play-audio").prop("disabled", false);
                    }
                }
            });

            $(document).on("click", ".play-audio", function () {
                let index = $(this).data("index");
                let audioType = $(this).data("audio-type");

                let audioElement = document.getElementById("responseAudio");
                switch (audioType) {
                    case "chatbot":
                        audioElement.src = "data:audio/aac;base64," + chatbotAudioResponses[index]; // audio/mpeg
                        break;
                    case "user":
                        audioElement.src = URL.createObjectURL(userAudios[index]);
                        break;
                    case "recommended":
                        audioElement.src = "data:audio/aac;base64," + userAudioResponses[index]; // audio/mpeg
                        break;
                }

                let speedText = $(".btn__speed span").text().replace("x", "");
                let speed = parseFloat(speedText);
                audioElement.playbackRate = speed;

                audioElement.play().catch(error => {
                    console.error("Playback failed:", error);
                });
            });

            let audio = document.getElementById("responseAudio");
            audio.addEventListener("play", () => {
                $("#recordButton").prop("disabled", true);
            });
            audio.addEventListener("ended", () => {
                if (userTurns < userMaxTurns) {
                    $("#recordButton").prop("disabled", false);
                }
            });
            audio.addEventListener("error", () => {
                if (userTurns < userMaxTurns) {
                    $("#recordButton").prop("disabled", false);
                }
            });

            initHtml();

            updateProgress(chatbotTurns);


            const types = [
                "audio/webm",
                "audio/mp4",
                "audio/wav"
            ];

            for (const type of types) {
                console.log(
                    `Is ${type} supported? ${MediaRecorder.isTypeSupported(type) ? "Yes!" : "Nope :("
                    }`,
                );
            }
        });
    </script>
</body>
</html>

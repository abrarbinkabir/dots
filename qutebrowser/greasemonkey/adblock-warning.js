// ==UserScript==
// @name         Remove Youtube Adblock Warnings!
// @namespace    http://tampermonkey.net/
// @version      0.2.2
// @description  No more 'Ad blockers are not allowed on YouTube'
// @author       coder369
// @license      MIT
// @match        https://www.youtube.com/*
// @icon         https://www.google.com/s2/favicons?sz=64&domain=youtube.com
// @grant        none
// ==/UserScript==
 
(function() {
    'use strict';
    var player = document.getElementById("movie_player");
    var closeit = setInterval(function() {
        if(document.getElementsByClassName("style-scope ytd-popup-container").length > 0 && document.getElementById("dismiss-button")&& document.getElementById("divider"))
        {
            setTimeout(function(){
                document.getElementById("dismiss-button").click();
                document.getElementsByClassName("ytp-play-button ytp-button")[0].click();
                console.log("banner closed");
                clearInterval(closeit);
            }, 4000);
        }
    }, 300);
})();

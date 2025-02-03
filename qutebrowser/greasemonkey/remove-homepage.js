// ==UserScript==
// @name         Hide YouTube Homepage Videos Immediately
// @namespace    http://tampermonkey.net/
// @version      0.1
// @description  Hide YouTube homepage videos based on specified selectors immediately after they are loaded
// @author       You
// @match        https://www.youtube.com/
// @grant        none
// ==/UserScript==

(function() {
    'use strict';
    window.addEventListener('load', function() {
        document.getElementById("guide").remove();
    });
})();

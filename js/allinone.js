/*!
  hey, [be]Lazy.js - v1.8.2 - 2016.10.25
  A fast, small and dependency free lazy load script (https://github.com/dinbror/blazy)
  (c) Bjoern Klinggaard - @bklinggaard - http://dinbror.dk/blazy
*/
  (function(q,m){"function"===typeof define&&define.amd?define(m):"object"===typeof exports?module.exports=m():q.Blazy=m()})(this,function(){function q(b){var c=b._util;c.elements=E(b.options);c.count=c.elements.length;c.destroyed&&(c.destroyed=!1,b.options.container&&l(b.options.container,function(a){n(a,"scroll",c.validateT)}),n(window,"resize",c.saveViewportOffsetT),n(window,"resize",c.validateT),n(window,"scroll",c.validateT));m(b)}function m(b){for(var c=b._util,a=0;a<c.count;a++){var d=c.elements[a],e;a:{var g=d;e=b.options;var p=g.getBoundingClientRect();if(e.container&&y&&(g=g.closest(e.containerClass))){g=g.getBoundingClientRect();e=r(g,f)?r(p,{top:g.top-e.offset,right:g.right+e.offset,bottom:g.bottom+e.offset,left:g.left-e.offset}):!1;break a}e=r(p,f)}if(e||t(d,b.options.successClass))b.load(d),c.elements.splice(a,1),c.count--,a--}0===c.count&&b.destroy()}function r(b,c){return b.right>=c.left&&b.bottom>=c.top&&b.left<=c.right&&b.top<=c.bottom}function z(b,c,a){if(!t(b,a.successClass)&&(c||a.loadInvisible||0<b.offsetWidth&&0<b.offsetHeight))if(c=b.getAttribute(u)||b.getAttribute(a.src)){c=c.split(a.separator);var d=c[A&&1<c.length?1:0],e=b.getAttribute(a.srcset),g="img"===b.nodeName.toLowerCase(),p=(c=b.parentNode)&&"picture"===c.nodeName.toLowerCase();if(g||void 0===b.src){var h=new Image,w=function(){a.error&&a.error(b,"invalid");v(b,a.errorClass);k(h,"error",w);k(h,"load",f)},f=function(){g?p||B(b,d,e):b.style.backgroundImage='url("'+d+'")';x(b,a);k(h,"load",f);k(h,"error",w)};p&&(h=b,l(c.getElementsByTagName("source"),function(b){var c=a.srcset,e=b.getAttribute(c);e&&(b.setAttribute("srcset",e),b.removeAttribute(c))}));n(h,"error",w);n(h,"load",f);B(h,d,e)}else b.src=d,x(b,a)}else"video"===b.nodeName.toLowerCase()?(l(b.getElementsByTagName("source"),function(b){var c=a.src,e=b.getAttribute(c);e&&(b.setAttribute("src",e),b.removeAttribute(c))}),b.load(),x(b,a)):(a.error&&a.error(b,"missing"),v(b,a.errorClass))}function x(b,c){v(b,c.successClass);c.success&&c.success(b);b.removeAttribute(c.src);b.removeAttribute(c.srcset);l(c.breakpoints,function(a){b.removeAttribute(a.src)})}function B(b,c,a){a&&b.setAttribute("srcset",a);b.src=c}function t(b,c){return-1!==(" "+b.className+" ").indexOf(" "+c+" ")}function v(b,c){t(b,c)||(b.className+=" "+c)}function E(b){var c=[];b=b.root.querySelectorAll(b.selector);for(var a=b.length;a--;c.unshift(b[a]));return c}function C(b){f.bottom=(window.innerHeight||document.documentElement.clientHeight)+b;f.right=(window.innerWidth||document.documentElement.clientWidth)+b}function n(b,c,a){b.attachEvent?b.attachEvent&&b.attachEvent("on"+c,a):b.addEventListener(c,a,{capture:!1,passive:!0})}function k(b,c,a){b.detachEvent?b.detachEvent&&b.detachEvent("on"+c,a):b.removeEventListener(c,a,{capture:!1,passive:!0})}function l(b,c){if(b&&c)for(var a=b.length,d=0;d<a&&!1!==c(b[d],d);d++);}function D(b,c,a){var d=0;return function(){var e=+new Date;e-d<c||(d=e,b.apply(a,arguments))}}var u,f,A,y;return function(b){if(!document.querySelectorAll){var c=document.createStyleSheet();document.querySelectorAll=function(a,b,d,h,f){f=document.all;b=[];a=a.replace(/\[for\b/gi,"[htmlFor").split(",");for(d=a.length;d--;){c.addRule(a[d],"k:v");for(h=f.length;h--;)f[h].currentStyle.k&&b.push(f[h]);c.removeRule(0)}return b}}var a=this,d=a._util={};d.elements=[];d.destroyed=!0;a.options=b||{};a.options.error=a.options.error||!1;a.options.offset=a.options.offset||100;a.options.root=a.options.root||document;a.options.success=a.options.success||!1;a.options.selector=a.options.selector||".b-lazy";a.options.separator=a.options.separator||"|";a.options.containerClass=a.options.container;a.options.container=a.options.containerClass?document.querySelectorAll(a.options.containerClass):!1;a.options.errorClass=a.options.errorClass||"b-error";a.options.breakpoints=a.options.breakpoints||!1;a.options.loadInvisible=a.options.loadInvisible||!1;a.options.successClass=a.options.successClass||"b-loaded";a.options.validateDelay=a.options.validateDelay||25;a.options.saveViewportOffsetDelay=a.options.saveViewportOffsetDelay||50;a.options.srcset=a.options.srcset||"data-srcset";a.options.src=u=a.options.src||"data-src";y=Element.prototype.closest;A=1<window.devicePixelRatio;f={};f.top=0-a.options.offset;f.left=0-a.options.offset;a.revalidate=function(){q(a)};a.load=function(a,b){var c=this.options;void 0===a.length?z(a,b,c):l(a,function(a){z(a,b,c)})};a.destroy=function(){var a=this._util;this.options.container&&l(this.options.container,function(b){k(b,"scroll",a.validateT)});k(window,"scroll",a.validateT);k(window,"resize",a.validateT);k(window,"resize",a.saveViewportOffsetT);a.count=0;a.elements.length=0;a.destroyed=!0};d.validateT=D(function(){m(a)},a.options.validateDelay,a);d.saveViewportOffsetT=D(function(){C(a.options.offset)},a.options.saveViewportOffsetDelay,a);C(a.options.offset);l(a.options.breakpoints,function(a){if(a.width>=window.screen.width)return u=a.src,!1});setTimeout(function(){q(a)})}});


/*! smooth-scroll v15.1.0 | (c) 2019 Chris Ferdinandi | MIT License | http://github.com/cferdinandi/smooth-scroll */
!function(t,e){"function"==typeof define&&define.amd?define([],function(){return e(t)}):"object"==typeof exports?module.exports=e(t):t.SmoothScroll=e(t)}("undefined"!=typeof global?global:"undefined"!=typeof window?window:this,function(O){"use strict";function I(){var n={};return Array.prototype.forEach.call(arguments,function(t){for(var e in t){if(!t.hasOwnProperty(e))return;n[e]=t[e]}}),n}function r(e){var n;try{n=decodeURIComponent(e)}catch(t){n=e}return n}function i(t){"#"===t.charAt(0)&&(t=t.substr(1));for(var e,n,o=String(t),a=o.length,r=-1,i="",c=o.charCodeAt(0);++r<a;){if(0===(e=o.charCodeAt(r)))throw new InvalidCharacterError("Invalid character: the input contains U+0000.");1<=e&&e<=31||127==e||0===r&&48<=e&&e<=57||1===r&&48<=e&&e<=57&&45===c?i+="\\"+e.toString(16)+" ":i+=128<=e||45===e||95===e||48<=e&&e<=57||65<=e&&e<=90||97<=e&&e<=122?o.charAt(r):"\\"+o.charAt(r)}try{n=decodeURIComponent("#"+i)}catch(t){n="#"+i}return n}function M(){return Math.max(document.body.scrollHeight,document.documentElement.scrollHeight,document.body.offsetHeight,document.documentElement.offsetHeight,document.body.clientHeight,document.documentElement.clientHeight)}function A(t){return t?function(t){return parseInt(O.getComputedStyle(t).height,10)}(t)+t.offsetTop:0}function C(t,e,n,o){if(e.emitEvents&&"function"==typeof O.CustomEvent){var a=new CustomEvent(t,{bubbles:!0,detail:{anchor:n,toggle:o}});document.dispatchEvent(a)}}var w={ignore:"[data-scroll-ignore]",header:null,topOnEmptyHash:!0,speed:500,speedAsDuration:!1,durationMax:null,durationMin:null,clip:!0,offset:0,easing:"easeInOutCubic",customEasing:null,updateURL:!0,popstate:!0,emitEvents:!0};return function(o,t){var v,a,S,E,b={};b.cancelScroll=function(t){cancelAnimationFrame(E),E=null,t||C("scrollCancel",v)},b.animateScroll=function(o,a,t){var r=I(v||w,t||{}),i="[object Number]"===Object.prototype.toString.call(o),e=i||!o.tagName?null:o;if(i||e){var c=O.pageYOffset;r.header&&!S&&(S=document.querySelector(r.header));var u,n,s,l=A(S),d=i?o:function(t,e,n,o){var a=0;if(t.offsetParent)for(;a+=t.offsetTop,t=t.offsetParent;);return a=Math.max(a-e-n,0),o&&(a=Math.min(a,M()-O.innerHeight)),a}(e,l,parseInt("function"==typeof r.offset?r.offset(o,a):r.offset,10),r.clip),f=d-c,m=M(),h=0,p=function(t,e){var n=e.speedAsDuration?e.speed:Math.abs(t/1e3*e.speed);return e.durationMax&&n>e.durationMax?e.durationMax:e.durationMin&&n<e.durationMin?e.durationMin:n}(f,r),g=function(t,e){var n=O.pageYOffset;if(t==e||n==e||(c<e&&O.innerHeight+n)>=m)return b.cancelScroll(!0),function(t,e,n){0===t&&document.body.focus(),n||(t.focus(),document.activeElement!==t&&(t.setAttribute("tabindex","-1"),t.focus(),t.style.outline="none"),O.scrollTo(0,e))}(o,e,i),C("scrollStop",r,o,a),!(E=u=null)},y=function(t){n=(h+=t-(u=u||t))/parseInt(p,10),s=c+f*function(t,e){var n;return"easeInQuad"===t.easing&&(n=e*e),"easeOutQuad"===t.easing&&(n=e*(2-e)),"easeInOutQuad"===t.easing&&(n=e<.5?2*e*e:(4-2*e)*e-1),"easeInCubic"===t.easing&&(n=e*e*e),"easeOutCubic"===t.easing&&(n=--e*e*e+1),"easeInOutCubic"===t.easing&&(n=e<.5?4*e*e*e:(e-1)*(2*e-2)*(2*e-2)+1),"easeInQuart"===t.easing&&(n=e*e*e*e),"easeOutQuart"===t.easing&&(n=1- --e*e*e*e),"easeInOutQuart"===t.easing&&(n=e<.5?8*e*e*e*e:1-8*--e*e*e*e),"easeInQuint"===t.easing&&(n=e*e*e*e*e),"easeOutQuint"===t.easing&&(n=1+--e*e*e*e*e),"easeInOutQuint"===t.easing&&(n=e<.5?16*e*e*e*e*e:1+16*--e*e*e*e*e),t.customEasing&&(n=t.customEasing(e)),n||e}(r,n=1<n?1:n),O.scrollTo(0,Math.floor(s)),g(s,d)||(E=O.requestAnimationFrame(y),u=t)};0===O.pageYOffset&&O.scrollTo(0,0),function(t,e,n){e||history.pushState&&n.updateURL&&history.pushState({smoothScroll:JSON.stringify(n),anchor:t.id},document.title,t===document.documentElement?"#top":"#"+t.id)}(o,i,r),C("scrollStart",r,o,a),b.cancelScroll(!0),O.requestAnimationFrame(y)}};function e(t){if(!("matchMedia"in O&&O.matchMedia("(prefers-reduced-motion)").matches)&&0===t.button&&!t.metaKey&&!t.ctrlKey&&"closest"in t.target&&(a=t.target.closest(o))&&"a"===a.tagName.toLowerCase()&&!t.target.closest(v.ignore)&&a.hostname===O.location.hostname&&a.pathname===O.location.pathname&&/#/.test(a.href)){var e=i(r(a.hash)),n=v.topOnEmptyHash&&"#"===e?document.documentElement:document.querySelector(e);(n=n||"#top"!==e?n:document.documentElement)&&(t.preventDefault(),function(t){if(history.replaceState&&t.updateURL&&!history.state){var e=O.location.hash;e=e||O.pageYOffset,history.replaceState({smoothScroll:JSON.stringify(t),anchor:e||O.pageYOffset},document.title,e||O.location.href)}}(v),b.animateScroll(n,a))}}function n(t){if(null!==history.state&&history.state.smoothScroll&&history.state.smoothScroll===JSON.stringify(v)){var e=history.state.anchor;e&&0!==e&&!(e=document.querySelector(i(r(history.state.anchor))))||b.animateScroll(e,null,{updateURL:!1})}}return b.destroy=function(){v&&(document.removeEventListener("click",e,!1),O.removeEventListener("popstate",n,!1),b.cancelScroll(),E=S=a=v=null)},b.init=function(t){if(!("querySelector"in document&&"addEventListener"in O&&"requestAnimationFrame"in O&&"closest"in O.Element.prototype))throw"Smooth Scroll: This browser does not support the required JavaScript methods and browser APIs.";b.destroy(),v=I(w,t||{}),S=v.header?document.querySelector(v.header):null,document.addEventListener("click",e,!1),v.updateURL&&v.popstate&&O.addEventListener("popstate",n,!1)},b.init(t),b}});


/*
* @Author: xzhih
* @Date:   2018-11-04 23:25:09
* @Last Modified by:   xzhih
* @Last Modified time: 2018-12-04 04:43:06
*/

// 保存搜索数据
var keepSearchData = function (siteRoot) {
    fetch(siteRoot + 'searchData.json')
    .then(function(response) {
        return response.json();
    })
    .then(function(resData) {
        localStorage.setItem('searchData', JSON.stringify(resData));
    })
}

// 检查和获取搜索数据
var checkAndGetData = function (siteRoot) {
    fetch(siteRoot + 'searchVersion.txt?t=' + (+new Date()))
    .then(function(response) {
        return response.text();
    })
    .then(function(resVersion) {
        if (localStorage.getItem('searchVersion') !== resVersion) {
            localStorage.setItem('searchVersion', resVersion);
            keepSearchData(siteRoot)
        }
    })
}

// 监听搜索
var searchFunc = function(siteRoot) {
    checkAndGetData(siteRoot)
    var localSearchData = localStorage.getItem("searchData");
    var datas = JSON.parse(localSearchData);
    var input = document.getElementById("local-search-input");
    if (!input) return;
    var resultContent = document.getElementById("local-search-result");
    input.addEventListener("input", function() {
        if (typeof(localSearchData) !== 'string') {
            localSearchData = localStorage.getItem("searchData");
            datas = JSON.parse(localSearchData);
        }
        printRs(this, datas, resultContent)
    });
};

// 监听搜索(SW)
var searchFuncSW = function(siteRoot) {
    fetch(siteRoot + 'searchData.json')
    .then(function(response) {
        return response.json();
    })
    .then(function(resData) {
        var localSearchData = JSON.stringify(resData);
        var datas = JSON.parse(localSearchData);
        var input = document.getElementById("local-search-input");
        if (!input) return;
        var resultContent = document.getElementById("local-search-result");
        input.addEventListener("input", function() {
            printRs(this, datas, resultContent)
        });
    });
};

// 打印结果
var printRs = function (input, datas, resultContent) {
    var str = '<ul class="search-result-list">';
    var keywords = input.value.trim().toLowerCase().split(/[\s\-]+/);
    resultContent.innerHTML = "";
    if (input.value.trim().length <= 0) {
        return;
    }
    datas.forEach(function(data) {
        var isMatch = true;
        var content_index = [];
        if (!data.title || data.title.trim() === "") {
            data.title = "Untitled";
        }
        var data_title = data.title.trim().toLowerCase();
        var data_content = data.content.trim().replace(/<[^>]+>/g, "").toLowerCase();
        var data_url = data.url;
        var index_title = -1;
        var index_content = -1;
        var first_occur = -1;
        if (data_content !== "") {
            keywords.forEach(function(keyword, i) {
                index_title = data_title.indexOf(keyword);
                index_content = data_content.indexOf(keyword);
                if (index_title < 0 && index_content < 0) {
                    isMatch = false;
                } else {
                    if (index_content < 0) {
                        index_content = 0;
                    }
                    if (i == 0) {
                        first_occur = index_content;
                    }
                }
            });
        } else {
            isMatch = false;
        }
        if (isMatch) {
            str += "<li><a href='" + data_url + "' class='search-result-title'>" + data_title + "</a>";
            var content = data.content.trim().replace(/<[^>]+>/g, "");
            if (first_occur >= 0) {
                var start = first_occur - 20;
                var end = first_occur + 80;
                if (start < 0) {
                    start = 0;
                }
                if (start == 0) {
                    end = 100;
                }
                if (end > content.length) {
                    end = content.length;
                }
                var match_content = content.substr(start, end);
                keywords.forEach(function(keyword) {
                    var regS = new RegExp(keyword, "gi");
                    match_content = match_content.replace(regS, '<em class="search-keyword">' + keyword + "</em>");
                });
                str += '<p class="search-result">' + match_content + "...</p>";
            }
            str += "</li>";
        }
    });
    str += "</ul>";
    resultContent.innerHTML = str;
}


// 锚点滚动
var scroll = new SmoothScroll('.toc-btn, .toc-link', {
    speed: 1000,
    easing: 'easeInOutCubic',
    speedAsDuration: true,
    clip: true
})

// 文章页面顶部进度条
var postProgressBar = function () {
    var progressBar = document.querySelector('progress')
    var header = document.querySelector('.floating-header')
    var title = document.querySelector('.post-full-title')
    var lastScrollY = window.scrollY
    var lastWindowHeight = window.innerHeight
    var ticking = false
    function onScroll() {
        lastScrollY = window.scrollY
        requestTick()
    }
    function requestTick() {
        if (!ticking) {
            requestAnimationFrame(update)
        }
        ticking = true
    }
    function update() {
        var rect = title.getBoundingClientRect()
        var trigger = rect.top + window.scrollY
        var triggerOffset = title.offsetHeight + 35
        var lastDocumentHeight = document.body.offsetHeight
        var progressMax = lastDocumentHeight - lastWindowHeight

        if (lastScrollY >= trigger + triggerOffset) {
            header.classList.add('floating-active')
        } else {
            header.classList.remove('floating-active')
        }
        progressBar.setAttribute('max', progressMax)
        progressBar.setAttribute('value', lastScrollY)
        ticking = false
    }
    window.addEventListener('scroll', onScroll, {passive: true})
    update()
}

// Toc
if (document.querySelector('.toc-bar')) {
    var tocBar = document.querySelector('.toc-bar ')
    var tocOpen = document.querySelector('.toc-open')
    var tocClose = document.querySelector('.toc-close')
    var tocSwitch = document.querySelector('.toc-switch')
    var tocMain = document.querySelector('.toc-main')
    var tocWidth = window.getComputedStyle(tocMain).width.replace("px","")

    if (document.body.clientWidth >= '768' ) {
        tocBar.style.right = -tocWidth + 'px'
    }

    window.addEventListener("resize", function(){
        var newTocWidth = window.getComputedStyle(tocMain).width.replace("px","")
        tocBar.removeAttribute("style")
        if (document.body.clientWidth >= '768' ) {
            tocBar.style.right = -newTocWidth + 'px'
        } else {
            tocBar.style.top = '100%'
        }
    });


    tocSwitch.addEventListener('click', function(){
        var newTocWidth = window.getComputedStyle(tocMain).width.replace("px","")

        window.requestAnimationFrame(function () {
            if (tocOpen.classList.contains('hide')) {
                if (document.body.clientWidth >= '768' ) {
                    tocBar.style.right = -newTocWidth + 'px'
                } else {
                    // 隐藏 toc
                    tocBar.style.top = '100%'
                }
                tocClose.classList.add('hide')
                tocOpen.classList.remove('hide')
            } else {
                if (document.body.clientWidth >= '768' ) {
                    tocBar.style.right = 0
                } else {
                    // 显示 toc
                    tocBar.style.top = 0
                }
                tocOpen.classList.add('hide')
                tocClose.classList.remove('hide')
            }
        })
    });

    // 移动设备下，点击关闭书签
    var tocItem = document.querySelectorAll('.toc-link')
    tocItem.forEach(function(toc) {
        toc.addEventListener('click', function(){
            window.requestAnimationFrame(function () {
                if (document.body.clientWidth < '768' ) {
                    tocBar.style.top = '100%'
                    tocClose.classList.add('hide')
                    tocOpen.classList.remove('hide')
                }
            })
        })
    });
}

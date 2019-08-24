/*!
  hey, [be]Lazy.js - v1.8.2 - 2016.10.25
  A fast, small and dependency free lazy load script (https://github.com/dinbror/blazy)
  (c) Bjoern Klinggaard - @bklinggaard - http://dinbror.dk/blazy
*/
  (function(q,m){"function"===typeof define&&define.amd?define(m):"object"===typeof exports?module.exports=m():q.Blazy=m()})(this,function(){function q(b){var c=b._util;c.elements=E(b.options);c.count=c.elements.length;c.destroyed&&(c.destroyed=!1,b.options.container&&l(b.options.container,function(a){n(a,"scroll",c.validateT)}),n(window,"resize",c.saveViewportOffsetT),n(window,"resize",c.validateT),n(window,"scroll",c.validateT));m(b)}function m(b){for(var c=b._util,a=0;a<c.count;a++){var d=c.elements[a],e;a:{var g=d;e=b.options;var p=g.getBoundingClientRect();if(e.container&&y&&(g=g.closest(e.containerClass))){g=g.getBoundingClientRect();e=r(g,f)?r(p,{top:g.top-e.offset,right:g.right+e.offset,bottom:g.bottom+e.offset,left:g.left-e.offset}):!1;break a}e=r(p,f)}if(e||t(d,b.options.successClass))b.load(d),c.elements.splice(a,1),c.count--,a--}0===c.count&&b.destroy()}function r(b,c){return b.right>=c.left&&b.bottom>=c.top&&b.left<=c.right&&b.top<=c.bottom}function z(b,c,a){if(!t(b,a.successClass)&&(c||a.loadInvisible||0<b.offsetWidth&&0<b.offsetHeight))if(c=b.getAttribute(u)||b.getAttribute(a.src)){c=c.split(a.separator);var d=c[A&&1<c.length?1:0],e=b.getAttribute(a.srcset),g="img"===b.nodeName.toLowerCase(),p=(c=b.parentNode)&&"picture"===c.nodeName.toLowerCase();if(g||void 0===b.src){var h=new Image,w=function(){a.error&&a.error(b,"invalid");v(b,a.errorClass);k(h,"error",w);k(h,"load",f)},f=function(){g?p||B(b,d,e):b.style.backgroundImage='url("'+d+'")';x(b,a);k(h,"load",f);k(h,"error",w)};p&&(h=b,l(c.getElementsByTagName("source"),function(b){var c=a.srcset,e=b.getAttribute(c);e&&(b.setAttribute("srcset",e),b.removeAttribute(c))}));n(h,"error",w);n(h,"load",f);B(h,d,e)}else b.src=d,x(b,a)}else"video"===b.nodeName.toLowerCase()?(l(b.getElementsByTagName("source"),function(b){var c=a.src,e=b.getAttribute(c);e&&(b.setAttribute("src",e),b.removeAttribute(c))}),b.load(),x(b,a)):(a.error&&a.error(b,"missing"),v(b,a.errorClass))}function x(b,c){v(b,c.successClass);c.success&&c.success(b);b.removeAttribute(c.src);b.removeAttribute(c.srcset);l(c.breakpoints,function(a){b.removeAttribute(a.src)})}function B(b,c,a){a&&b.setAttribute("srcset",a);b.src=c}function t(b,c){return-1!==(" "+b.className+" ").indexOf(" "+c+" ")}function v(b,c){t(b,c)||(b.className+=" "+c)}function E(b){var c=[];b=b.root.querySelectorAll(b.selector);for(var a=b.length;a--;c.unshift(b[a]));return c}function C(b){f.bottom=(window.innerHeight||document.documentElement.clientHeight)+b;f.right=(window.innerWidth||document.documentElement.clientWidth)+b}function n(b,c,a){b.attachEvent?b.attachEvent&&b.attachEvent("on"+c,a):b.addEventListener(c,a,{capture:!1,passive:!0})}function k(b,c,a){b.detachEvent?b.detachEvent&&b.detachEvent("on"+c,a):b.removeEventListener(c,a,{capture:!1,passive:!0})}function l(b,c){if(b&&c)for(var a=b.length,d=0;d<a&&!1!==c(b[d],d);d++);}function D(b,c,a){var d=0;return function(){var e=+new Date;e-d<c||(d=e,b.apply(a,arguments))}}var u,f,A,y;return function(b){if(!document.querySelectorAll){var c=document.createStyleSheet();document.querySelectorAll=function(a,b,d,h,f){f=document.all;b=[];a=a.replace(/\[for\b/gi,"[htmlFor").split(",");for(d=a.length;d--;){c.addRule(a[d],"k:v");for(h=f.length;h--;)f[h].currentStyle.k&&b.push(f[h]);c.removeRule(0)}return b}}var a=this,d=a._util={};d.elements=[];d.destroyed=!0;a.options=b||{};a.options.error=a.options.error||!1;a.options.offset=a.options.offset||100;a.options.root=a.options.root||document;a.options.success=a.options.success||!1;a.options.selector=a.options.selector||".b-lazy";a.options.separator=a.options.separator||"|";a.options.containerClass=a.options.container;a.options.container=a.options.containerClass?document.querySelectorAll(a.options.containerClass):!1;a.options.errorClass=a.options.errorClass||"b-error";a.options.breakpoints=a.options.breakpoints||!1;a.options.loadInvisible=a.options.loadInvisible||!1;a.options.successClass=a.options.successClass||"b-loaded";a.options.validateDelay=a.options.validateDelay||25;a.options.saveViewportOffsetDelay=a.options.saveViewportOffsetDelay||50;a.options.srcset=a.options.srcset||"data-srcset";a.options.src=u=a.options.src||"data-src";y=Element.prototype.closest;A=1<window.devicePixelRatio;f={};f.top=0-a.options.offset;f.left=0-a.options.offset;a.revalidate=function(){q(a)};a.load=function(a,b){var c=this.options;void 0===a.length?z(a,b,c):l(a,function(a){z(a,b,c)})};a.destroy=function(){var a=this._util;this.options.container&&l(this.options.container,function(b){k(b,"scroll",a.validateT)});k(window,"scroll",a.validateT);k(window,"resize",a.validateT);k(window,"resize",a.saveViewportOffsetT);a.count=0;a.elements.length=0;a.destroyed=!0};d.validateT=D(function(){m(a)},a.options.validateDelay,a);d.saveViewportOffsetT=D(function(){C(a.options.offset)},a.options.saveViewportOffsetDelay,a);C(a.options.offset);l(a.options.breakpoints,function(a){if(a.width>=window.screen.width)return u=a.src,!1});setTimeout(function(){q(a)})}});

/*!
 * smooth-scroll v16.1.0
 * Animate scrolling to anchor links
 * (c) 2019 Chris Ferdinandi
 * MIT License
 * http://github.com/cferdinandi/smooth-scroll
 */

/**
 * closest() polyfill
 * @link https://developer.mozilla.org/en-US/docs/Web/API/Element/closest#Polyfill
 */
if (window.Element && !Element.prototype.closest) {
    Element.prototype.closest = function(s) {
        var matches = (this.document || this.ownerDocument).querySelectorAll(s),
            i,
            el = this;
        do {
            i = matches.length;
            while (--i >= 0 && matches.item(i) !== el) {}
        } while ((i < 0) && (el = el.parentElement));
        return el;
    };
}

/**
 * CustomEvent() polyfill
 * https://developer.mozilla.org/en-US/docs/Web/API/CustomEvent/CustomEvent#Polyfill
 */
(function () {

    if (typeof window.CustomEvent === "function") return false;

    function CustomEvent(event, params) {
        params = params || { bubbles: false, cancelable: false, detail: undefined };
        var evt = document.createEvent('CustomEvent');
        evt.initCustomEvent(event, params.bubbles, params.cancelable, params.detail);
        return evt;
    }

    CustomEvent.prototype = window.Event.prototype;

    window.CustomEvent = CustomEvent;
})();
/**
 * requestAnimationFrame() polyfill
 * By Erik Möller. Fixes from Paul Irish and Tino Zijdel.
 * @link http://paulirish.com/2011/requestanimationframe-for-smart-animating/
 * @link http://my.opera.com/emoller/blog/2011/12/20/requestanimationframe-for-smart-er-animating
 * @license MIT
 */
(function() {
    var lastTime = 0;
    var vendors = ['ms', 'moz', 'webkit', 'o'];
    for(var x = 0; x < vendors.length && !window.requestAnimationFrame; ++x) {
        window.requestAnimationFrame = window[vendors[x]+'RequestAnimationFrame'];
        window.cancelAnimationFrame = window[vendors[x]+'CancelAnimationFrame'] ||
                                      window[vendors[x]+'CancelRequestAnimationFrame'];
    }

    if (!window.requestAnimationFrame) {
        window.requestAnimationFrame = function(callback, element) {
            var currTime = new Date().getTime();
            var timeToCall = Math.max(0, 16 - (currTime - lastTime));
            var id = window.setTimeout((function() { callback(currTime + timeToCall); }),
                timeToCall);
            lastTime = currTime + timeToCall;
            return id;
        };
    }

    if (!window.cancelAnimationFrame) {
        window.cancelAnimationFrame = function(id) {
            clearTimeout(id);
        };
    }
}());

(function (root, factory) {
    if (typeof define === 'function' && define.amd) {
        define([], (function () {
            return factory(root);
        }));
    } else if (typeof exports === 'object') {
        module.exports = factory(root);
    } else {
        root.SmoothScroll = factory(root);
    }
})(typeof global !== 'undefined' ? global : typeof window !== 'undefined' ? window : this, (function (window) {

    'use strict';

    //
    // Default settings
    //

    var defaults = {

        // Selectors
        ignore: '[data-scroll-ignore]',
        header: null,
        topOnEmptyHash: true,

        // Speed & Duration
        speed: 500,
        speedAsDuration: false,
        durationMax: null,
        durationMin: null,
        clip: true,
        offset: 0,

        // Easing
        easing: 'easeInOutCubic',
        customEasing: null,

        // History
        updateURL: true,
        popstate: true,

        // Custom Events
        emitEvents: true

    };


    //
    // Utility Methods
    //

    /**
     * Check if browser supports required methods
     * @return {Boolean} Returns true if all required methods are supported
     */
    var supports = function () {
        return (
            'querySelector' in document &&
            'addEventListener' in window &&
            'requestAnimationFrame' in window &&
            'closest' in window.Element.prototype
        );
    };

    /**
     * Merge two or more objects together.
     * @param   {Object}   objects  The objects to merge together
     * @returns {Object}            Merged values of defaults and options
     */
    var extend = function () {
        var merged = {};
        Array.prototype.forEach.call(arguments, (function (obj) {
            for (var key in obj) {
                if (!obj.hasOwnProperty(key)) return;
                merged[key] = obj[key];
            }
        }));
        return merged;
    };

    /**
     * Check to see if user prefers reduced motion
     * @param  {Object} settings Script settings
     */
    var reduceMotion = function () {
        if ('matchMedia' in window && window.matchMedia('(prefers-reduced-motion)').matches) {
            return true;
        }
        return false;
    };

    /**
     * Get the height of an element.
     * @param  {Node} elem The element to get the height of
     * @return {Number}    The element's height in pixels
     */
    var getHeight = function (elem) {
        return parseInt(window.getComputedStyle(elem).height, 10);
    };

    /**
     * Decode a URI, with error check
     * @param  {String} hash The URI to decode
     * @return {String}      A decoded URI (or the original string if an error is thrown)
     */
    var decode = function (hash) {
        var decoded;
        try {
            decoded = decodeURIComponent(hash);
        } catch(e) {
            decoded = hash;
        }
        return decoded;
    };

    /**
     * Escape special characters for use with querySelector
     * @author Mathias Bynens
     * @link https://github.com/mathiasbynens/CSS.escape
     * @param {String} id The anchor ID to escape
     */
    var escapeCharacters = function (id) {

        // Remove leading hash
        if (id.charAt(0) === '#') {
            id = id.substr(1);
        }

        var string = String(id);
        var length = string.length;
        var index = -1;
        var codeUnit;
        var result = '';
        var firstCodeUnit = string.charCodeAt(0);
        while (++index < length) {
            codeUnit = string.charCodeAt(index);
            // Note: there’s no need to special-case astral symbols, surrogate
            // pairs, or lone surrogates.

            // If the character is NULL (U+0000), then throw an
            // `InvalidCharacterError` exception and terminate these steps.
            if (codeUnit === 0x0000) {
                throw new InvalidCharacterError(
                    'Invalid character: the input contains U+0000.'
                );
            }

            if (
                // If the character is in the range [\1-\1F] (U+0001 to U+001F) or is
                // U+007F, […]
                (codeUnit >= 0x0001 && codeUnit <= 0x001F) || codeUnit == 0x007F ||
                // If the character is the first character and is in the range [0-9]
                // (U+0030 to U+0039), […]
                (index === 0 && codeUnit >= 0x0030 && codeUnit <= 0x0039) ||
                // If the character is the second character and is in the range [0-9]
                // (U+0030 to U+0039) and the first character is a `-` (U+002D), […]
                (
                    index === 1 &&
                    codeUnit >= 0x0030 && codeUnit <= 0x0039 &&
                    firstCodeUnit === 0x002D
                )
            ) {
                // http://dev.w3.org/csswg/cssom/#escape-a-character-as-code-point
                result += '\\' + codeUnit.toString(16) + ' ';
                continue;
            }

            // If the character is not handled by one of the above rules and is
            // greater than or equal to U+0080, is `-` (U+002D) or `_` (U+005F), or
            // is in one of the ranges [0-9] (U+0030 to U+0039), [A-Z] (U+0041 to
            // U+005A), or [a-z] (U+0061 to U+007A), […]
            if (
                codeUnit >= 0x0080 ||
                codeUnit === 0x002D ||
                codeUnit === 0x005F ||
                codeUnit >= 0x0030 && codeUnit <= 0x0039 ||
                codeUnit >= 0x0041 && codeUnit <= 0x005A ||
                codeUnit >= 0x0061 && codeUnit <= 0x007A
            ) {
                // the character itself
                result += string.charAt(index);
                continue;
            }

            // Otherwise, the escaped character.
            // http://dev.w3.org/csswg/cssom/#escape-a-character
            result += '\\' + string.charAt(index);

        }

        // Return sanitized hash
        return '#' + result;

    };

    /**
     * Calculate the easing pattern
     * @link https://gist.github.com/gre/1650294
     * @param {String} type Easing pattern
     * @param {Number} time Time animation should take to complete
     * @returns {Number}
     */
    var easingPattern = function (settings, time) {
        var pattern;

        // Default Easing Patterns
        if (settings.easing === 'easeInQuad') pattern = time * time; // accelerating from zero velocity
        if (settings.easing === 'easeOutQuad') pattern = time * (2 - time); // decelerating to zero velocity
        if (settings.easing === 'easeInOutQuad') pattern = time < 0.5 ? 2 * time * time : -1 + (4 - 2 * time) * time; // acceleration until halfway, then deceleration
        if (settings.easing === 'easeInCubic') pattern = time * time * time; // accelerating from zero velocity
        if (settings.easing === 'easeOutCubic') pattern = (--time) * time * time + 1; // decelerating to zero velocity
        if (settings.easing === 'easeInOutCubic') pattern = time < 0.5 ? 4 * time * time * time : (time - 1) * (2 * time - 2) * (2 * time - 2) + 1; // acceleration until halfway, then deceleration
        if (settings.easing === 'easeInQuart') pattern = time * time * time * time; // accelerating from zero velocity
        if (settings.easing === 'easeOutQuart') pattern = 1 - (--time) * time * time * time; // decelerating to zero velocity
        if (settings.easing === 'easeInOutQuart') pattern = time < 0.5 ? 8 * time * time * time * time : 1 - 8 * (--time) * time * time * time; // acceleration until halfway, then deceleration
        if (settings.easing === 'easeInQuint') pattern = time * time * time * time * time; // accelerating from zero velocity
        if (settings.easing === 'easeOutQuint') pattern = 1 + (--time) * time * time * time * time; // decelerating to zero velocity
        if (settings.easing === 'easeInOutQuint') pattern = time < 0.5 ? 16 * time * time * time * time * time : 1 + 16 * (--time) * time * time * time * time; // acceleration until halfway, then deceleration

        // Custom Easing Patterns
        if (!!settings.customEasing) pattern = settings.customEasing(time);

        return pattern || time; // no easing, no acceleration
    };

    /**
     * Determine the document's height
     * @returns {Number}
     */
    var getDocumentHeight = function () {
        return Math.max(
            document.body.scrollHeight, document.documentElement.scrollHeight,
            document.body.offsetHeight, document.documentElement.offsetHeight,
            document.body.clientHeight, document.documentElement.clientHeight
        );
    };

    /**
     * Calculate how far to scroll
     * Clip support added by robjtede - https://github.com/cferdinandi/smooth-scroll/issues/405
     * @param {Element} anchor       The anchor element to scroll to
     * @param {Number}  headerHeight Height of a fixed header, if any
     * @param {Number}  offset       Number of pixels by which to offset scroll
     * @param {Boolean} clip         If true, adjust scroll distance to prevent abrupt stops near the bottom of the page
     * @returns {Number}
     */
    var getEndLocation = function (anchor, headerHeight, offset, clip) {
        var location = 0;
        if (anchor.offsetParent) {
            do {
                location += anchor.offsetTop;
                anchor = anchor.offsetParent;
            } while (anchor);
        }
        location = Math.max(location - headerHeight - offset, 0);
        if (clip) {
            location = Math.min(location, getDocumentHeight() - window.innerHeight);
        }
        return location;
    };

    /**
     * Get the height of the fixed header
     * @param  {Node}   header The header
     * @return {Number}        The height of the header
     */
    var getHeaderHeight = function (header) {
        return !header ? 0 : (getHeight(header) + header.offsetTop);
    };

    /**
     * Calculate the speed to use for the animation
     * @param  {Number} distance The distance to travel
     * @param  {Object} settings The plugin settings
     * @return {Number}          How fast to animate
     */
    var getSpeed = function (distance, settings) {
        var speed = settings.speedAsDuration ? settings.speed : Math.abs(distance / 1000 * settings.speed);
        if (settings.durationMax && speed > settings.durationMax) return settings.durationMax;
        if (settings.durationMin && speed < settings.durationMin) return settings.durationMin;
        return parseInt(speed, 10);
    };

    var setHistory = function (options) {

        // Make sure this should run
        if (!history.replaceState || !options.updateURL || history.state) return;

        // Get the hash to use
        var hash = window.location.hash;
        hash = hash ? hash : '';

        // Set a default history
        history.replaceState(
            {
                smoothScroll: JSON.stringify(options),
                anchor: hash ? hash : window.pageYOffset
            },
            document.title,
            hash ? hash : window.location.href
        );

    };

    /**
     * Update the URL
     * @param  {Node}    anchor  The anchor that was scrolled to
     * @param  {Boolean} isNum   If true, anchor is a number
     * @param  {Object}  options Settings for Smooth Scroll
     */
    var updateURL = function (anchor, isNum, options) {

        // Bail if the anchor is a number
        if (isNum) return;

        // Verify that pushState is supported and the updateURL option is enabled
        if (!history.pushState || !options.updateURL) return;

        // Update URL
        history.pushState(
            {
                smoothScroll: JSON.stringify(options),
                anchor: anchor.id
            },
            document.title,
            anchor === document.documentElement ? '#top' : '#' + anchor.id
        );

    };

    /**
     * Bring the anchored element into focus
     * @param {Node}     anchor      The anchor element
     * @param {Number}   endLocation The end location to scroll to
     * @param {Boolean}  isNum       If true, scroll is to a position rather than an element
     */
    var adjustFocus = function (anchor, endLocation, isNum) {

        // Is scrolling to top of page, blur
        if (anchor === 0) {
            document.body.focus();
        }

        // Don't run if scrolling to a number on the page
        if (isNum) return;

        // Otherwise, bring anchor element into focus
        anchor.focus();
        if (document.activeElement !== anchor) {
            anchor.setAttribute('tabindex', '-1');
            anchor.focus();
            anchor.style.outline = 'none';
        }
        window.scrollTo(0 , endLocation);

    };

    /**
     * Emit a custom event
     * @param  {String} type    The event type
     * @param  {Object} options The settings object
     * @param  {Node}   anchor  The anchor element
     * @param  {Node}   toggle  The toggle element
     */
    var emitEvent = function (type, options, anchor, toggle) {
        if (!options.emitEvents || typeof window.CustomEvent !== 'function') return;
        var event = new CustomEvent(type, {
            bubbles: true,
            detail: {
                anchor: anchor,
                toggle: toggle
            }
        });
        document.dispatchEvent(event);
    };


    //
    // SmoothScroll Constructor
    //

    var SmoothScroll = function (selector, options) {

        //
        // Variables
        //

        var smoothScroll = {}; // Object for public APIs
        var settings, anchor, toggle, fixedHeader, eventTimeout, animationInterval;


        //
        // Methods
        //

        /**
         * Cancel a scroll-in-progress
         */
        smoothScroll.cancelScroll = function (noEvent) {
            cancelAnimationFrame(animationInterval);
            animationInterval = null;
            if (noEvent) return;
            emitEvent('scrollCancel', settings);
        };

        /**
         * Start/stop the scrolling animation
         * @param {Node|Number} anchor  The element or position to scroll to
         * @param {Element}     toggle  The element that toggled the scroll event
         * @param {Object}      options
         */
        smoothScroll.animateScroll = function (anchor, toggle, options) {

            // Cancel any in progress scrolls
            smoothScroll.cancelScroll();

            // Local settings
            var _settings = extend(settings || defaults, options || {}); // Merge user options with defaults

            // Selectors and variables
            var isNum = Object.prototype.toString.call(anchor) === '[object Number]' ? true : false;
            var anchorElem = isNum || !anchor.tagName ? null : anchor;
            if (!isNum && !anchorElem) return;
            var startLocation = window.pageYOffset; // Current location on the page
            if (_settings.header && !fixedHeader) {
                // Get the fixed header if not already set
                fixedHeader = document.querySelector(_settings.header);
            }
            var headerHeight = getHeaderHeight(fixedHeader);
            var endLocation = isNum ? anchor : getEndLocation(anchorElem, headerHeight, parseInt((typeof _settings.offset === 'function' ? _settings.offset(anchor, toggle) : _settings.offset), 10), _settings.clip); // Location to scroll to
            var distance = endLocation - startLocation; // distance to travel
            var documentHeight = getDocumentHeight();
            var timeLapsed = 0;
            var speed = getSpeed(distance, _settings);
            var start, percentage, position;

            /**
             * Stop the scroll animation when it reaches its target (or the bottom/top of page)
             * @param {Number} position Current position on the page
             * @param {Number} endLocation Scroll to location
             * @param {Number} animationInterval How much to scroll on this loop
             */
            var stopAnimateScroll = function (position, endLocation) {

                // Get the current location
                var currentLocation = window.pageYOffset;

                // Check if the end location has been reached yet (or we've hit the end of the document)
                if (position == endLocation || currentLocation == endLocation || ((startLocation < endLocation && window.innerHeight + currentLocation) >= documentHeight)) {

                    // Clear the animation timer
                    smoothScroll.cancelScroll(true);

                    // Bring the anchored element into focus
                    adjustFocus(anchor, endLocation, isNum);

                    // Emit a custom event
                    emitEvent('scrollStop', _settings, anchor, toggle);

                    // Reset start
                    start = null;
                    animationInterval = null;

                    return true;

                }
            };

            /**
             * Loop scrolling animation
             */
            var loopAnimateScroll = function (timestamp) {
                if (!start) { start = timestamp; }
                timeLapsed += timestamp - start;
                percentage = speed === 0 ? 0 : (timeLapsed / speed);
                percentage = (percentage > 1) ? 1 : percentage;
                position = startLocation + (distance * easingPattern(_settings, percentage));
                window.scrollTo(0, Math.floor(position));
                if (!stopAnimateScroll(position, endLocation)) {
                    animationInterval = window.requestAnimationFrame(loopAnimateScroll);
                    start = timestamp;
                }
            };

            /**
             * Reset position to fix weird iOS bug
             * @link https://github.com/cferdinandi/smooth-scroll/issues/45
             */
            if (window.pageYOffset === 0) {
                window.scrollTo(0, 0);
            }

            // Update the URL
            updateURL(anchor, isNum, _settings);

            // If the user prefers reduced motion, jump to location
            if (reduceMotion()) {
                window.scrollTo(0, Math.floor(endLocation));
                return;
            }

            // Emit a custom event
            emitEvent('scrollStart', _settings, anchor, toggle);

            // Start scrolling animation
            smoothScroll.cancelScroll(true);
            window.requestAnimationFrame(loopAnimateScroll);

        };

        /**
         * If smooth scroll element clicked, animate scroll
         */
        var clickHandler = function (event) {

            // Don't run if event was canceled but still bubbled up
            // By @mgreter - https://github.com/cferdinandi/smooth-scroll/pull/462/
            if (event.defaultPrevented) return;

            // Don't run if right-click or command/control + click or shift + click
            if (event.button !== 0 || event.metaKey || event.ctrlKey || event.shiftKey) return;

            // Check if event.target has closest() method
            // By @totegi - https://github.com/cferdinandi/smooth-scroll/pull/401/
            if (!('closest' in event.target)) return;

            // Check if a smooth scroll link was clicked
            toggle = event.target.closest(selector);
            if (!toggle || toggle.tagName.toLowerCase() !== 'a' || event.target.closest(settings.ignore)) return;

            // Only run if link is an anchor and points to the current page
            if (toggle.hostname !== window.location.hostname || toggle.pathname !== window.location.pathname || !/#/.test(toggle.href)) return;

            // Get an escaped version of the hash
            var hash = escapeCharacters(decode(toggle.hash));

            // Get the anchored element
            var anchor;
            if (hash === '#') {
                if (!settings.topOnEmptyHash) return;
                anchor = document.documentElement;
            } else {
                anchor = document.querySelector(hash);
            }
            anchor = !anchor && hash === '#top' ? document.documentElement : anchor;

            // If anchored element exists, scroll to it
            if (!anchor) return;
            event.preventDefault();
            setHistory(settings);
            smoothScroll.animateScroll(anchor, toggle);

        };

        /**
         * Animate scroll on popstate events
         */
        var popstateHandler = function (event) {

            // Stop if history.state doesn't exist (ex. if clicking on a broken anchor link).
            // fixes `Cannot read property 'smoothScroll' of null` error getting thrown.
            if (history.state === null) return;

            // Only run if state is a popstate record for this instantiation
            if (!history.state.smoothScroll || history.state.smoothScroll !== JSON.stringify(settings)) return;

            // Only run if state includes an anchor

            // if (!history.state.anchor && history.state.anchor !== 0) return;

            // Get the anchor
            var anchor = history.state.anchor;
            if (typeof anchor === 'string' && anchor) {
                anchor = document.querySelector(escapeCharacters(decode(history.state.anchor)));
                if (!anchor) return;
            }

            // Animate scroll to anchor link
            smoothScroll.animateScroll(anchor, null, {updateURL: false});

        };

        /**
         * Destroy the current initialization.
         */
        smoothScroll.destroy = function () {

            // If plugin isn't already initialized, stop
            if (!settings) return;

            // Remove event listeners
            document.removeEventListener('click', clickHandler, false);
            window.removeEventListener('popstate', popstateHandler, false);

            // Cancel any scrolls-in-progress
            smoothScroll.cancelScroll();

            // Reset variables
            settings = null;
            anchor = null;
            toggle = null;
            fixedHeader = null;
            eventTimeout = null;
            animationInterval = null;

        };

        /**
         * Initialize Smooth Scroll
         * @param {Object} options User settings
         */
        var init = function () {

            // feature test
            if (!supports()) throw 'Smooth Scroll: This browser does not support the required JavaScript methods and browser APIs.';

            // Destroy any existing initializations
            smoothScroll.destroy();

            // Selectors and variables
            settings = extend(defaults, options || {}); // Merge user options with defaults
            fixedHeader = settings.header ? document.querySelector(settings.header) : null; // Get the fixed header

            // When a toggle is clicked, run the click handler
            document.addEventListener('click', clickHandler, false);

            // If updateURL and popState are enabled, listen for pop events
            if (settings.updateURL && settings.popstate) {
                window.addEventListener('popstate', popstateHandler, false);
            }

        };


        //
        // Initialize plugin
        //

        init();


        //
        // Public APIs
        //

        return smoothScroll;

    };

    return SmoothScroll;

}));

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


/*
* @Author: xzhih
* @Last Modified by: xzhih
*/

var openPhotoSwipe = function (pswpElement, postImg, index) {
    var items = []
    var item = {}

    for (var i = 0; i < postImg.length; i++) {
        var imgSrc = postImg[i].getAttribute('data-img')
        item = {
            src: imgSrc,
            msrc: imgSrc,
            w: 200,
            h: 200
        };
        items.push(item);
    }

    var options = {
        zoomEl: true,
        arrowEl: true,
        shareEl: false,
        preloaderEl: false,
        captionEl: false,
        history: false,
        // showHideOpacity: true,
        showAnimationDuration: 0,
        hideAnimationDuration: 500,
        index: parseInt(index, 10),
        getThumbBoundsFn: function (idx) {
            var pageYScroll = window.pageYOffset || document.documentElement.scrollTop;

            var rect = postImg[idx].getBoundingClientRect();
            
            return {
                x: rect.left,
                y: rect.top + pageYScroll,
                w: rect.width
            };
        }
    };

    var gallery = new PhotoSwipe(pswpElement, PhotoSwipeUI_Default, items, options);

    gallery.listen('gettingData', function (index, item) {
        if (item.h === 200 || item.w === 200) {
            var img = new Image()
            img.onload = function() {
                item.w = parseInt(img.width, 10)
                item.h = parseInt(img.height, 10)
                gallery.updateSize(true)
            }
            img.src = item.src
        }
    })

    gallery.init();
}

var initPagePhotoSwipe = function () {
    var pswpElement = document.querySelectorAll('.pswp')[0]
    if (!pswpElement) {
        return
    }

    var postImg = document.querySelectorAll('.post-img')
    if (postImg.length === 0) {
        return
    }

    postImg.forEach(function (element) {
        var index = element.getAttribute('data-index')
        element.addEventListener("click", function (e) {
            e.stopPropagation()
            openPhotoSwipe(pswpElement, postImg, index)
        }, false)
    });
}

initPagePhotoSwipe()

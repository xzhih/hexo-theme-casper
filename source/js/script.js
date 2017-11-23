$(document).ready(function () {
    var progressBar = document.querySelector('progress');
    var header = document.querySelector('.floating-header');
    var title = document.querySelector('.post-full-title');
    var lastScrollY = window.scrollY;
    var lastWindowHeight = window.innerHeight;
    var lastDocumentHeight = $(document).height();
    var ticking = false;

    function onScroll() {
        lastScrollY = window.scrollY;
        requestTick();
    }
    function onResize() {
        lastWindowHeight = window.innerHeight;
        lastDocumentHeight = $(document).height();
        requestTick();
    }
    function requestTick() {
        if (!ticking) {
            requestAnimationFrame(update);
        }
        ticking = true;
    }
    function update() {
        var rect = title.getBoundingClientRect();
        var trigger = rect.top + window.scrollY;
        var triggerOffset = title.offsetHeight + 35;
        var progressMax = lastDocumentHeight - lastWindowHeight;
            // show/hide floating header
            if (lastScrollY >= trigger + triggerOffset) {
                header.classList.add('floating-active');
            } else {
                header.classList.remove('floating-active');
            }
            progressBar.setAttribute('max', progressMax);
            progressBar.setAttribute('value', lastScrollY);
            ticking = false;
        }
        window.addEventListener('scroll', onScroll, {passive: true});
        window.addEventListener('resize', onResize, false);
        update();

        // TOC
        var width = $('.toc-main').width();
        $('.toc-control').click(function () {
            if ($('.t-g-control').css('width')=="50px") {
                if ($('.t-g-control').css('right')=="0px") {
                    $('.t-g-control').animate({right: width}, "slow");
                    $('.toc-main').animate({right: 0}, "slow");
                    toc_icon()
                } else {
                    $('.t-g-control').animate({right: 0}, "slow");
                    $('.toc-main').animate({right: -width}, "slow");
                    toc_icon()
                }
            } else {
                if ($('.toc-main').css('right')=="0px") {
                    $('.toc-main').slideToggle("fast", toc_icon());
                } else {
                    $('.toc-main').css('right', '0px');
                    toc_icon()
                }
            }
        })

        function toc_icon() {
            if ($('.toc-icon').css('display')=="none") {
                $('.toc-close').hide();
                $('.toc-icon').show();
            } else {
                $('.toc-icon').hide();
                $('.toc-close').show();
            }
        }

        $('.gotop').click(function(){
            $('html,body').animate({scrollTop:$('.post-full-header').offset().top}, 800);
        });
        $('.gobottom').click(function () {
            $('html,body').animate({scrollTop:$('.pagination').offset().top}, 800);
        });

        // highlight
        // https://highlightjs.org
        $('pre code').each(function(i, block) {
            hljs.highlightBlock(block);
        });
        $('td.code').each(function(i, block) {
            hljs.highlightBlock(block);
        });
    });
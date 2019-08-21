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

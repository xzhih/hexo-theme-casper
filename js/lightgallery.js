
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

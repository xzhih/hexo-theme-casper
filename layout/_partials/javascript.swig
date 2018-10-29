{# javascript #}
{# 百度 SEO #}
{% if theme.baidu %}
<script>
    (function(){
        var bp = document.createElement('script');
        var curProtocol = window.location.protocol.split(':')[0];
        if (curProtocol === 'https') {
            bp.src = 'https://zz.bdstatic.com/linksubmit/push.js';
        }
        else {
            bp.src = 'http://push.zhanzhang.baidu.com/push.js';
        }
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(bp, s);
    })();
    console.log("this theme is from https://github.com/xzhih/hexo-theme-casper")
</script>
{% endif %}

{# 懒加载 #}
{% if theme.lazyload or !is_post() %}
<script>
    {% include "public/lazyload.js" %}
    ;(function() {var bLazy = new Blazy()})();
</script>
{% endif %}

{% if is_post() %}
{% include "public/fload-header.swig" %}

{% if theme.CDN.jquery %}
<script src="{{ theme.CDN.jquery }}"></script>
{% else %}
{{ js('js/jquery.min') }}
{% endif %}

<script>
    $(document).ready(function () {
        // 阅读页面顶部进度条
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

        // 回到顶部
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
</script>

{% if theme.CDN.highlightjs %}
<script src="{{ theme.CDN.highlightjs }}"></script>
{% else %}
{{ js('js/highlight.min') }}
{% endif %}

{% if theme.comment %}
<script src="//cdn1.lncld.net/static/js/3.0.4/av-min.js"></script>
<script src='//cdn.jsdelivr.net/npm/valine/dist/Valine.min.js '></script>
{% endif %}

{% if theme.lightgallery %}

{% if theme.CDN.lightgalleryjs %}
<script src="{{ theme.CDN.lightgalleryjs }}"></script>
{% else %}
{{ js('js/lightgallery.min') }}
{% endif %}

{% if theme.CDN.lightgallerycss %}
<link rel="stylesheet" href="{{ theme.CDN.lightgallerycss }}">
{% else %}
{{ css('css/lightgallery.min') }}
{% endif %}

<script>
    $(function () {
        // var postImg = $('#lightgallery').find('img');
        // postImg.addClass('post-img');
        // postImg.each(function () {
        //     var imgSrc = $(this).attr('src');
        //     $(this).attr('data-src', imgSrc);
        // });
        $('#lightgallery').lightGallery({selector: '.post-img'});
    });
</script>
{% endif %}

{% if theme.comment %}
<script>
    new Valine({
        el: '#comment' ,
        verify: {{ theme.valine.verify }},
        notify: {{ theme.valine.notify }},
        appId: '{{ theme.valine.appId }}',
        appKey: '{{ theme.valine.appKey }}',
        placeholder: '{{ theme.valine.placeholder }}',
        pageSize: {{ theme.valine.pageSize }},
        avatar:'{{ theme.valine.avatar }}',
    });
</script>
{% endif %}
{% endif %}

{# 本地搜索 #}
{% if theme.local_search %}
<script type="text/javascript"> 
    // 保存搜索数据
    var keepSearchData = function  () {
        var xhr2 = new XMLHttpRequest();
        xhr2.open("GET", "{{ config.root }}searchData.json", true);
        xhr2.onreadystatechange = function () {
            if(this.readyState == 4){
                var res = this.responseText;
                localStorage.setItem('searchData', res);
            }
        }
        xhr2.send();
    }

    // 检查和获取搜索数据
    var checkAndGetData = function () {
        var xhr1 = new XMLHttpRequest();
        xhr1.open("GET", "{{ config.root }}searchVersion.txt?t=" + (+new Date()), true);
        xhr1.onreadystatechange = function () {
            if(this.readyState == 4){
                var res = this.responseText;
                if (localStorage.getItem('searchVersion') !== res) {
                    localStorage.setItem('searchVersion', res);
                    keepSearchData()
                }
            }
        }
        xhr1.send();
    }

    checkAndGetData()

    // 输入并搜索
    var searchFunc = function(search_id, content_id) {
        "use strict";
        var localSearchData = localStorage.getItem("searchData");
        var datas = JSON.parse(localSearchData);
        var input = document.getElementById(search_id);
        if (!input) return;
        var resultContent = document.getElementById(content_id);
        input.addEventListener("input", function() {
            var str = '<ul class="search-result-list">';
            var keywords = this.value.trim().toLowerCase().split(/[\s\-]+/);
            resultContent.innerHTML = "";
            if (this.value.trim().length <= 0) {
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
        });
    };
    searchFunc("local-search-input", "local-search-result");
</script>

{% endif %}
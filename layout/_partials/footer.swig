{# footer #}
{% include "widget/widget.swig" %}
<footer class="site-footer outer">
	<div class="site-footer-content inner">
		<section class="copyright">
			<a href="{{ config.root }}" title="{{ config.title }}">{{ config.title }}</a>
			&copy; {{ date(Date.now(), 'YYYY') }}
		</section>
		<nav class="site-footer-nav">
			{% for key,link in theme.footer %}
            <a href="{{ link }}" title="{{ key }}" target="_blank" rel="noopener">{{ key }}</a>
            {% endfor %}
            {{ link_to('https://hexo.io', 'Hexo', {external: true})}}
            {{ link_to('https://github.com/xzhih/hexo-theme-casper', 'Casper', {external: true})}}
        </nav>
    </div>
</footer>

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
</script>
{% endif %}

{% if not is_post() %}
<script>
    {% include "public/lazyload.js" %}
    ;(function() {var bLazy = new Blazy();})();
</script>
{% endif %}

{% if is_post() %}
{% include "public/fload-header.swig" %}
<script>
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

        console.log("this theme is from https://github.com/xzhih/hexo-theme-casper")
    });
</script>
{% if theme.lightgallery %}

{% if theme.CDN.lightgallerycss %}
<link rel="stylesheet" href="{{ theme.CDN.lightgallerycss }}">
{% else %}
{{ css('css/lightgallery.min') }}
{% endif %}

{% if theme.CDN.lightgalleryjs %}
<script src="{{ theme.CDN.lightgalleryjs }}"></script>
{% else %}
{{ js('js/lightgallery.min') }}
{% endif %}

<script>
	$(function () {
		var postImg = $('#lightgallery').find('img');
		postImg.addClass('post-img');
		postImg.each(function () {
			var imgSrc = $(this).attr('src');
			$(this).attr('data-src', imgSrc);
		});
		$('#lightgallery').lightGallery({selector: '.post-img'});
	});
</script>

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
{% endif %}
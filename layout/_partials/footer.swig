{# footer #}
{% include "widget/widget.swig" %}
<footer class="site-footer outer">
	<div class="site-footer-content inner">
		<section class="copyright">
			<a href="{{ config.root }}">{{ config.title }}</a>
			&copy; {{ date(Date.now(), 'YYYY') }}
		</section>
		<nav class="site-footer-nav">
			<a href="//hexo.io/">{{ __('powered_by') }} Hexo</a>
			<a href="//github.com/xzhih/">Theme Pure</a>
		</nav>
	</div>
</footer>
{% if is_post() %}
{% include "public/fload-header.swig" %}
{% if theme.lightgallery %}
{{ css('css/lightgallery.min') }}
{{ js('js/lightgallery.min') }}
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
{% endif %}
{% endif %}
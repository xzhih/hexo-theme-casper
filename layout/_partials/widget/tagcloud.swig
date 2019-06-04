{# 插件 - 标签云 #}
{% if site.tags.length %}
<article class="read-next-card" {% if theme.header_image %} style="background-image: url({{ theme.header_image }})" {% endif %} >
	<header class="read-next-card-header tagcloud-card">
		<h3 class="read-next-card-header-title">{{ __('tagcloud') }}</h3>
	</header>
	<div class="read-next-card-content-ext">
		{{ tagcloud({min_font: 14, max_font: 24}) }}
	</div>
</article>
{% endif %}
{# HTML 中的 <head></head> 部分 #}
{% set title = page.title %}
{% if is_home() %} 
{% set title = config.title %}
{% elseif is_archive() %} 
{% set title = __('archive_a') %}
{% elseif is_month() %}
{% set title += ': ' + page.year + '/' + page.month %}
{% elseif is_year() %}
{% set title += ': ' + page.year %}
{% elseif is_category() %}
{% set title = __('category') + ': ' + page.category %}
{% elseif is_tag() %}
{% set title = __('tag') + ': ' + page.tag %}
{% endif %}
{% set body_class = 'tag-template' %}
{% if is_home() %}
{% set body_class = 'home-template' %}
{% elseif is_post() %}
{% set body_class = 'post-template' %}
{% elseif is_page %}
{% set body_class = 'page-template' %}
{% endif %}
<head>
	{% if theme.googleAnalytics %}
	<!-- Global Site Tag (gtag.js) - Google Analytics -->
	<script async src="https://www.googletagmanager.com/gtag/js?id={{ theme.GA_TRACKING_ID }}"></script>
	<script>
		window.dataLayer = window.dataLayer || [];
		function gtag(){dataLayer.push(arguments);}
		gtag('js', new Date());
		gtag('config', '{{ theme.GA_TRACKING_ID }}');
	</script>
	{% endif %}
	<meta charset="UTF-8"/>
	<meta name="HandheldFriendly" content="True" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>
	{% if theme.chromeNavColor %}
	<meta name="theme-color" content="#{{ theme.chromeNavColor }}">
	{% endif %}
	<title>{% if title %}{{ title }}{% else %}{{ config.title }}{% endif %} | {% if is_home() %}{{ config.subtitle }}{% else %}{{ config.title }}{% endif %}</title>
	<meta name="description" content="{{ config.subtitle }}" />
	<meta name="generator" content="{{ config.title }}">

	{% if theme.rss %}
	{{ feed_tag(theme.rss, [{title:config.title}])  }}
	{% endif %}

	{% if theme.favicon %}
	{{ favicon_tag(theme.favicon) }}
	{% endif %}
	{# {{ css('css/screen') }} #}
	{# {{ css('css/style') }} #}
	{{ css('css/allinone.min') }} 

	{% if is_post() %}
	{% if theme.CDN.jquery %}
	<script src="{{ theme.CDN.jquery }}"></script>
	{% else %}
	{{ js('js/jquery') }}
	{% endif %}

	{% if theme.CDN.highlightjs %}
	<script src="{{ theme.CDN.highlightjs }}"></script>
	{% else %}
	{{ js('js/highlight.min') }}
	{% endif %}

	{% if theme.comment %}
	<script src="//cdn1.lncld.net/static/js/3.0.4/av-min.js"></script>
    <script src='//cdn.jsdelivr.net/npm/valine/dist/Valine.min.js '></script>
	{% endif %}
	{% endif %}
</head>
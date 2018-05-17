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
{% endif %}
<head>
	{# {{ css('css/screen') }} #}
	{# {{ css('css/style') }} #}
	{{ css('css/allinone.min') }} 

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

	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />

	<title>{% if title %}{{ title }}{% else %}{{ config.title }}{% endif %} | {% if is_home() %}{{ config.subtitle }}{% else %}{{ config.title }}{% endif %}</title>

	<meta name="HandheldFriendly" content="True" />
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>
	<meta name="generator" content="hexo">
	<meta name="author" content="{{ config.author }}">
	<meta name="description" content="{% if is_post() %}{{ page.description }}{% else %}{{ config.description }}{% endif %}">

	{% if theme.keywords %}
	<meta name="keywords" content="{% if is_post() %}{{ page.keywords }}{% else %}{{ theme.keywords }}{% endif %}">
	{% endif %}

	{% if theme.favicon %}
	{{ favicon_tag(theme.favicon) }}
	{% endif %}

	{% if theme.navColor %}
	<meta name="theme-color" content="#{{ theme.navColor }}">
	<meta name="msapplication-TileColor" content="#{{ theme.navColor }}">
	{% endif %}

	{% if theme.manifest %}
	<link rel="manifest" href="/manifest.json">
	{% endif %}

	{% if theme.rss %}
	{{ feed_tag(theme.rss, [{title:config.title}])  }}
	{% endif %}

	<meta property="og:site_name" content="{{ config.title }}">
	<meta property="og:type" content="{% if is_post() %}article{% else %}blog{% endif %}">
	<meta property="og:title" content="{% if title %}{{ title }}{% else %}{{ config.title }}{% endif %} | {% if is_home() %}{{ config.subtitle }}{% else %}{{ config.title }}{% endif %}">
	<meta property="og:description" content="{% if is_post() %}{{ page.description }}{% else %}{{ config.description }}{% endif %}">
	<meta property="og:url" content="{{ config.url }}{{ url_for(page.path) }}">

	{% if is_post() %}
	<meta property="article:published_time" content="{{ date(page.date, 'YYYY-MM-DDTHH:MM:SS+08:00') }}"/> 
	<meta property="article:author" content="{{ config.author }}">
	<meta property="article:published_first" content="{{ config.title }}, {{ url_for(page.path) }}" />
	{% endif %}

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
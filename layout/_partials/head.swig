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
	{# {{ css('css/screen') }}
	{{ css('css/style') }}
	{{ css('css/markdown') }}
	{{ css('css/highlight') }} #}

	{{ css('css/allinone.min') }}

	{% if is_post() && theme.prismjs %}
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/prism/1.4.1/themes/prism.min.css">
	{% endif %}


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
	{% if theme.momently %}
	<script src="//s3-us-west-2.amazonaws.com/momently-static/loader/{{theme.momentlyId}}_momently.js" name="momently-script"></script>
	{% endif %}

	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />

	<title>{% if title %}{{ title }}{% else %}{{ config.title }}{% endif %} | {% if is_home() %}{{ config.subtitle }}{% else %}{{ config.title }}{% endif %}</title>

	<meta name="HandheldFriendly" content="True" />
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=2"/>
	<meta name="generator" content="hexo">
	<meta name="author" content="{{ config.author }}">
	<meta name="description" content="{% if is_post() %}{{ page.description }}{% else %}{{ config.description }}{% endif %}">

	{% if theme.keywords %}
	<meta name="keywords" content="{% if is_post() %}{{ page.keywords }}{% else %}{{ theme.keywords }}{% endif %}">
	{% endif %}

	{% if theme.favicon %}
	{{ favicon_tag(theme.favicon) }}
	<link rel="apple-touch-icon" href="{{ theme.favicon }}"/>
	{% endif %}

	{% if theme.navColor %}
	<meta name="theme-color" content="#{{ theme.navColor }}">
	<meta name="msapplication-TileColor" content="#{{ theme.navColor }}">
	{% endif %}

	{% if theme.manifest %}
	<link rel="manifest" href="{{ url_for('/manifest.json') }}">
	{% endif %}

	{% if theme.rss %}
	<link rel="alternate" type="application/rss+xml" href="{{url_for(theme.rss)}}" title="{{config.title}}">
	{% endif %}

	<meta property="og:site_name" content="{{ config.title }}">
	<meta property="og:type" content="{% if is_post() %}article{% else %}blog{% endif %}">
	<meta property="og:title" content="{% if title %}{{ title }}{% else %}{{ config.title }}{% endif %} | {% if is_home() %}{{ config.subtitle }}{% else %}{{ config.title }}{% endif %}">
	<meta property="og:description" content="{% if is_post() %}{{ page.description }}{% else %}{{ config.description }}{% endif %}">
	<meta property="og:url" content="{{ config.url }}{{ url_for(page.path) }}">
	<meta property="og:image" content="{{ config.url }}{{ config.root }}{% if is_post() %}{{ page.image }}{% endif %}">
	<meta name="twitter:card" content="summary_large_image">

	{% if is_post() %}
	<meta property="article:published_time" content="{{ date(page.date, 'YYYY-MM-DDTHH:MM:SS+08:00') }}"/> 
	<meta property="article:author" content="{{ config.author }}">
	<meta property="article:published_first" content="{{ config.title }}, {{ url_for(page.path) }}" />
	<meta property="article:tag" content="{{ page.tags }}" />
	{% endif %}
</head>
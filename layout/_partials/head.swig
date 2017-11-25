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
	<meta charset="UTF-8"/>
	<meta name="HandheldFriendly" content="True" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>
	<meta name="theme-color" content="{{ theme.chromeNavColor }}">
	<title>{% if title %}{{ title }} | {% endif %}{{ config.title }}</title>
	<meta name="description" content="{{ config.subtitle }}" />
	<meta name="generator" content="{{ config.title }}">
	{% if theme.rss %}
	{{ feed_tag(theme.rss, [{title:config.title}])  }}
	{% endif %}
	{% if theme.favicon and theme.favicon.length %}
	{{ favicon_tag(theme.favicon) }}
	{% endif %}
	{{ css('css/screen.min') }}
	{{ css('css/style') }} 
	{% if is_post() %}
	{{ js('js/jquery') }}
	{{ js('js/highlight.min') }}
	{% endif %}
</head>
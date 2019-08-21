{% if is_post() %}
<link rel="canonical" href="{{ page.permalink }}"/>
<script type="application/ld+json">
	[
	{
		"@context": "http://schema.org",
		"@type": "WebPage",
		"name": "{{ page.title }}",
		"datePublished": "{{ date_xml(page.date) }}",
		"@id": "{{ page.permalink }}",
		"author": {"@type": "Person",
		"name": "{{ config.author }}"},
		"description": "{{ page.description }}",
		"image": "{% if page.ld_json_img %}{{ page.ld_json_img }}{% else %}{{ page.cover_img }}{% endif %}"
	},
	{
		"@context": "http://schema.org",
		"@type": "BreadcrumbList",
		"itemListElement": 
		[
		{
			"@type": "ListItem",
			"position": 1,
			"name": "首页",
			"item": "{{ config.url }}"
		},
		{
			"@type": "ListItem",
			"position": 2,
			"name": "{{ page.title }}",
			"item": "{{ page.permalink }}"
		}
		]
	}
	]
</script>
{% endif %}

{% if is_home() %}
<script type="application/ld+json">
	{
		"@context":"http://schema.org",
		"@type":"Blog",
		"@id":"{{ url }}",
		"headline": "{{ config.title }}",
		"dateModified": "{{ date_xml(Date.now()) }}",
		"description": "{{ config.description }}",
		"blogPost": [{% for post in page.posts %}{% if loop.index != 1 %},
		{% endif %}{"@type":"BlogPosting",
		"headline":"{{ post.title }}",
		"dateModified": "{{ date_xml(post.updated) }}",
		"datePublished":"{{ date_xml(post.date) }}",
		"author": {"@type": "Person",
		"name": "{{ config.author }}"},
		"publisher": {"@type": "Organization",
		"name": "{{ config.title }}",
		"logo": {"@type": "ImageObject",
		"url": "{{ config.url+theme.favicon }}"}},
		"image": "{{ post.cover_img }}",
		"mainEntityOfPage": "{{ post.permalink }}",
		"articleBody": "{{ truncate(post.content | striptags,{length: 100}) }}"}{% endfor %}]
	}
</script>
{% endif %}
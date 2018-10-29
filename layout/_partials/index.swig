{# 首页、归档、分类、标签 #}
{% macro tpl() %}
<main id="site-main" class="site-main outer" role="main">
	<div class="inner">
		<div class="post-feed">
			{% for post in page.posts %}
			<article class="post-card post {% if not post.cover_img %} no-image {% endif %}">
				{% if post.cover_img %}
				<a class="post-card-image-link" title="{{ post.title }}" href="{{ url_for(post.path) }}">
					<div class="post-card-image b-lazy" data-src="{{ post.cover_img }}"></div>
				</a>
				{% endif %}
				<div class="post-card-content">
					<a class="post-card-content-link" title="{{ post.title }}" href="{{ url_for(post.path) }}">
						<header class="post-card-header">
							<span class="post-card-tags">
								{% if post.categories %}
								{% for cate in post.categories %}
								{{ cate.name }}
								{% endfor %}| 
								{% endif %}
								<time datetime="{{ date_xml(post.date) }}" itemprop="datePublished">
									{{ date(post.date, null) }}
								</time>
							</span>
							<h2 class="post-card-title">{{ post.title }}</h2>
						</header>
						<section class="post-card-excerpt">
							<p>
								{% set num = 100 %}
								{% if not post.cover_img %}
								{% set num = 240 %}
								{% endif %}
								{% set content = post.content | striptags %}
								{{ content.substring(0, num) }}
								{% if content.length > num %}...{% endif %}
							</p>
						</section>
					</a>
					<footer class="post-card-meta">
						<ul class="author-list">
							<li class="author-list-item">
								<div class="author-name-tooltip">{{ config.author }}</div>
								{% if theme.author_image %}
								<a href="/about" class="static-avatar">
									<img class="author-profile-image" src="{{ theme.author_image }}" alt="{{ config.author }}" />
								</a>
								{% else %}
								<a href="/about" class="static-avatar author-profile-image">
									{% include "public/icons/avatar.svg" %}
								</a>
								{% endif %}
							</li>
						</ul>
						<span class="reading-time">
							{{ Math.round(strip_html(post.content).length/500) }}
							min read
						</span>
					</footer>
				</div>
			</article>
			{% endfor %}
		</div>
	</div>

	{# 显示页号 #}
	{% if config.index_generator.per_page !== 0 %}
	<nav class="pagination">
		{% if page.total > 1 %}
		<nav class="page-nav">
			{{ paginator({prev_text: '← Prev', next_text: 'Next →'}) }}
		</nav>
		{% endif %}
	</nav>
	{% endif %}
	
</main>
{% endmacro %}
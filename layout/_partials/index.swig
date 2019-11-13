{# 首页、归档、分类、标签 #}
{% macro tpl() %}
<div id="site-main" class="site-main outer" role="main">
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
								<time datetime="{{ date_xml(post.date) }}">
									{{ date(post.date, null) }}
								</time>
							</span>
							<h2 class="post-card-title">{{ post.title }}</h2>
						</header>
						<div class="post-card-excerpt">
							<p>
								{% set num = 100 %}
								{% if not post.cover_img %}
								{% set num = 240 %}
								{% endif %}
								{% if loop.first %}
								{% set num = 80 %}
								{% endif %}
								{% set content = post.content | striptags %}
								{% if post.summary %}
								{% set content = post.summary %}
								{% endif %}
								{{ content.substring(0, num) }}
								{% if content.length > num %}...{% endif %}
							</p>
						</div>
					</a>
					<footer class="post-card-meta">
						<div class="author-list">
							<div class="author-list-item">
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
							</div>
						</div>
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
</div>

{# 显示页号 #}
{% if config.index_generator.per_page !== 0 %}
<div class="outer">
	<nav class="pagination">
		{% if page.total > 1 %}
		<nav class="page-nav">
			{{ paginator({prev_text: '← PREV', next_text: 'NEXT →'}) }}
		</nav>
		{% endif %}
	</nav>
</div>
{% endif %}
{% endmacro %}
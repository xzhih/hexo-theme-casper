{# 文章页 #}
{% macro tpl() %}
<div id="site-main" class="site-main outer" role="main">
    <div class="inner">
        <header class="post-full-header">
            <div class="post-full-meta">
                <time  class="post-full-meta-date" datetime="{{ date_xml(page.date) }}">
                    {{ date(page.date, 'YYYY-MM-D') }}
                </time>
                {% if page.categories %}
                <span class="date-divider">/</span>
                {% for cate in page.categories %}
                <a href="{{ url_for(cate.path) }}">{{ cate.name }}</a>&nbsp;&nbsp;
                {% endfor %}
                {% endif %}
            </div>
            <h1 class="post-full-title">{{ page.title }}</h1>
        </header>
        <div class="post-full {% if not page.feature_img %}no-image{% endif %}">
            {% if page.feature_img %}
            <figure class="post-full-image" style="background-image: url({{ page.feature_img }})">
            </figure>
            {% endif %}
            <div class="post-full-content">
                <article id="photoswipe" class="markdown-body">
                    {{ page.content }}
                </article>
                <ul class="tags-postTags">
                    {% for tag in page.tags %}
                    <li>
                        <a href="{{ url_for(tag.path) }}" rel="tag"># {{ tag.name }}</a>
                    </li>
                    {% endfor %}
                </ul>
            </div>
        </div>
    </div>

    {# 在文章底部显示上下篇 #}
    <nav id="gobottom" class="pagination">
        {% if page.prev %}
        <a class="prev-post" title="{{ page.prev.title }}" href="{{ url_for(page.prev.path) }}">
            ← {{ page.prev.title }}
        </a>
        {% endif %}
        <span class="prev-next-post">·</span>
        {% if page.next %}
        <a class="next-post" title="{{ page.next.title }}" href="{{ url_for(page.next.path) }}">
            {{ page.next.title }} →
        </a>
        {% endif %}
    </nav>

    {% if theme.comment %}
    <div class="inner">
        <div id="comment"></div>
    </div>
    {% endif %}
</div>
{% if theme.post_toc %}
{% include "public/toc.swig" %}
{% endif %}

{% if theme.photoswipe %}
{% include "public/photoswipe.swig" %}
{% endif %}

{% endmacro %}
{# 文章页 #}
{% macro tpl() %}
<main id="site-main" class="site-main outer" role="main">
    <div class="inner">
        <header class="post-full-header">
            <section class="post-full-meta">
                <time  class="post-full-meta-date" datetime="{{ date_xml(page.date) }}" itemprop="datePublished">
                    {{ date(page.date, 'YYYY-MM-DD') }}
                </time>
                {% if page.tags %}
                {% for tag in page.tags %}
                <span class="date-divider">/</span>
                <a href="{{ url_for(tag.path) }}">{{ tag.name }}</a>
                {% endfor %}
                {% endif %}
            </section>
            <h1 class="post-full-title">{{ page.title }}</h1>
        </header>
        <article class="post-full {% if not page.feature_img %}no-image{% endif %}">
            {% if page.feature_img %}
            <figure class="post-full-image" style="background-image: url({{ page.feature_img }})">
            </figure>
            {% endif %}
            <section class="post-full-content">
                <div id="lightgallery" class="markdown-body">
                    {{ page.content }}
                </div>
            </section>
        </article>
    </div>

    {# 在文章底部显示上下篇 #}
    <div style="height: 4vw;width: 100%"></div>
    <nav id="gobottom" class="pagination">
        {% if page.prev %}
        <a class="prev-post" title="{{ page.prev.title }}" href="{{ url_for(page.prev.path) }}">
            ← {{ page.prev.title }}
        </a>
        {% endif %}
        <span class="prev-next-post">•</span>
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
</main>
{% if theme.post_toc %}
{% include "public/toc.swig" %}
{% endif %}
{% endmacro %}
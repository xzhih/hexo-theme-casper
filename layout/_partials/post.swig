{# 文章页 #}
{% macro tpl() %}
<main id="site-main" class="site-main outer" role="main">
    <div class="inner">

        <header class="post-full-header">
            <section class="post-full-meta">
                <time  class="post-full-meta-date" datetime="{{ date_xml(page.date) }}" itemprop="datePublished">
                    {{ date(page.date, 'YYYY-MM-D') }}
                </time>
                {% if page.categories and page.categories.length %}
                <span class="date-divider">/</span>
                {% for cate in page.categories %}
                <a href="{{ url_for(cate.path) }}">{{ cate.name }}</a>&nbsp;&nbsp;
                {% endfor %}
                {% endif %}
            </section>
            <h1 class="post-full-title">{{ page.title }}</h1>
        </header>

        <article class="post-full {% if not (page.feature_img_link and page.feature_img) %} no-image {% endif %}">

            {% if page.feature_img_link and page.feature_img %}
            <figure class="post-full-image" style="background-image: url({{ page.feature_img_link }})">
            </figure>
            {% endif %}

            <section class="post-full-content">
                <div class="kg-card-markdown">
                    {{ page.content }}
                </div>
            </section>

        </article>

    </div>
    {% include 'public/pagination.swig' %}
</main>
{% endmacro %}
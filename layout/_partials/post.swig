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

            {# Show Author Details 
            <footer class="post-full-footer">
                <section class="author-card">
                    <span class="avatar-wrapper">
                        <svg viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><g fill="none" fill-rule="evenodd"><path d="M3.513 18.998C4.749 15.504 8.082 13 12 13s7.251 2.504 8.487 5.998C18.47 21.442 15.417 23 12 23s-6.47-1.558-8.487-4.002zM12 12c2.21 0 4-2.79 4-5s-1.79-4-4-4-4 1.79-4 4 1.79 5 4 5z" fill="#FFF"/></g></svg>
                    </span>
                    <section class="author-card-content">
                        <h4 class="author-card-name"><a href="/author/anthony/">Anthony Ison</a></h4>
                        <p>Read <a href="/author/anthony/">more posts</a> by this author.</p>
                    </section>
                </section>
                <div class="post-full-footer-right">
                    <a class="author-card-button" href="/author/anthony/">Read More</a>
                </div>
            </footer>
            #}

            {# Show Disqus Comments #}
            <section class="post-full-comments">
                <div id="disqus_thread"></div>
<script>
var disqus_config = function () {
	this.page.url = "{{ url_for(page.url) }}";  
	this.page.identifier = "{{ page.identifier }}"
};
(function() {
    var d = document, s = d.createElement('script');
    s.src = 'https://{{ config.disqus_shortname }}.disqus.com/embed.js';
    s.setAttribute('data-timestamp', +new Date());
    (d.head || d.body).appendChild(s);
})();
</script>
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
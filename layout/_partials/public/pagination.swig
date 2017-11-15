{# 翻页, 在 page 底部显示页号, 在文章底部显示上下文 #}
<nav class="pagination">
    {% if not is_post() %}
    {% if page.total > 1 %}
        <nav class="page-nav">
            {{ paginator({prev_text: '← Prev', next_text: 'Next →'}) }}
        </nav>
    {% endif %}
    {% else %}
    {% if page.prev %}
    <a class="prev-post" href="{{ url_for(page.prev.path) }}">
        ← {{ page.prev.title }}
    </a>
    {% endif %}
    <span class="prev-next-post">•</span>
    {% if page.next %}
    <a class="next-post" href="{{ url_for(page.next.path) }}">
        {{ page.next.title }} →
    </a>
    {% endif %}
    {% endif %}
</nav>
{# 插件容器, 在需要的页面引入 #}
<aside class="read-next outer">
    <div class="inner">
        <div class="read-next-feed">
            {% if theme.widgets.recent_posts %}
            {% include 'recent_posts.swig' %}
            {% endif %}
            {% if theme.widgets.category %}
            {% include 'category.swig' %}
            {% endif %}
            {% if theme.widgets.tagcloud %}
            {% include 'tagcloud.swig' %}
            {% endif %}
        </div>
    </div>
</aside>

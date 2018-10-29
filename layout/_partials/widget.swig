{# 插件容器, 在需要的页面引入 #}

{% if theme.widgets %}
<aside class="read-next outer">
    <div class="inner">
        <div class="read-next-feed">
            {% if theme.widgets.recent_posts %}
            {% include 'widget/recent_posts.swig' %}
            {% endif %}
            {% if theme.widgets.category %}
            {% include 'widget/category.swig' %}
            {% endif %}
            {% if theme.widgets.tagcloud %}
            {% include 'widget/tagcloud.swig' %}
            {% endif %}
        </div>
    </div>
</aside>
{% endif %}
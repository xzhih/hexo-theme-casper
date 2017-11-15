{# 插件 - 分类 #}
{% if site.categories.length %}
<article class="read-next-card" {% if theme.cover_image %} style="background-image: url({{ theme.cover_image }})" {% endif %} >
    <header class="read-next-card-header" style="padding-bottom: 20px">
        <h3 class="read-next-card-header-title">{{ __('categories') }}</h3>
    </header>
    <div class="read-next-card-content">
        <ul>
            {{ list_categories({show_count: false}) }}
        </ul>
    </div>
</article>
{% endif %}

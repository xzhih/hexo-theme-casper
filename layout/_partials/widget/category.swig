{# 插件 - 分类 #}
{% if site.categories.length %}
<article class="read-next-card" {% if theme.header_image %} style="background-image: url({{ theme.header_image }})" {% endif %} >
    <header class="read-next-card-header tagcloud-card">
        <h3 class="read-next-card-header-title">{{ __('categories') }}</h3>
    </header>
    <div class="read-next-card-content">
        {{ list_categories({show_count: false}) }}
    </div>
</article>
{% endif %}

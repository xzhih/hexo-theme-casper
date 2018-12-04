{# search #}

{% if theme.local_search %}
<div id="search" class="search-overlay subscribe-overlay">
    <div class="search-form">
        {% if theme.favicon %}
        <img class="search-overlay-logo" src="{{ theme.favicon }}" alt="{{ config.title }}">
        {% endif %}
        <input id="local-search-input" class="search-input" type="text" name="search" placeholder="{{ __('search') }} ...">
        <a class="search-overlay-close" href="#"></a>
    </div>
    <div id="local-search-result"></div>
</div>
{% endif %}
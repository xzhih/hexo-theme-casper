{# search #}

{% if theme.local_search %}
<div id="search" class="search-overlay">
    <div class="search-form">
        {% if theme.favicon %}
        <div class="search-overlay-logo">
        	<img src="{{ theme.favicon }}" alt="{{ config.title }}">
        </div>
        {% endif %}
        <input id="local-search-input" class="search-input" type="text" name="search" placeholder="{{ __('search') }} ...">
        <a class="search-overlay-close" href="#"></a>
    </div>
    <div id="local-search-result"></div>
</div>
{% endif %}
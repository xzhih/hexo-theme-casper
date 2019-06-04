<div class="floating-header" >
	<div class="floating-header-logo">
        <a href="{{ url_for('/') }}" title="{{ config.title }}">
			{% if theme.favicon %}
                <img src="{{ theme.favicon }}" alt="{{ config.title }} icon" />
			{% endif %}
            <span>{{ config.title }}</span>
        </a>
    </div>
    <span class="floating-header-divider">&mdash;</span>
    <div class="floating-header-title">{{ page.title }}</div>
    <progress class="progress" value="0">
        <span class="progress-container">
            <span class="progress-bar"></span>
        </span>
    </progress>
</div>
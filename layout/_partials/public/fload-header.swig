<div class="floating-header" >
    <div class="floating-header-logo">
        <a href="{{ config.root }}">
            {% if theme.blog_logo %}
                <img src="{{ theme.blog_logo }}" alt="{{ config.title }} icon" />
            {% endif %}
            <span>{{ config.title }}</span>
        </a>
    </div>
    <span class="floating-header-divider">&mdash;</span>
    <div class="floating-header-title">{{ title }}</div>
    <div class="floating-header-share">
        <div class="floating-header-share-label">Share this </div>
        <a class="floating-header-share-tw" href="">
            
        </a>
        <a class="floating-header-share-fb" href="">
        </a>
    </div>
    <progress class="progress" value="0">
        <div class="progress-container">
            <span class="progress-bar"></span>
        </div>
    </progress>
</div>

{{ js('js/script') }}
<header class="site-header outer {% if theme.header_image %}" style="background-image: url({{ theme.header_image }})"{% else %}no-cover"{% endif %}>
    <div class="inner">
        {% include 'public/nav.swig' %}
        <div class="site-header-content">
            {% if theme.author_image %}
            <img class="author-profile-image" src="{{ theme.author_image }}" alt="{{ config.author }}" />
            {% endif %}
            <h1 class="site-title">{{ config.author }}</h1>
            {% if theme.author_bio %}
            <h2 class="author-bio">{{ theme.author_bio }}</h2>
            {% endif %}
            <div class="author-meta">
                {% if theme.author_location %}
                <div class="author-location">{{ theme.author_location }} <span class="bull">&bull;</span></div>
                {% endif %}
                <a class="author-stats" href="{{ url_for('/archives') }}" title="{{ _p('total', site.posts.length) }}">
                    {{ _p('total', site.posts.length) }}
                    <span class="bull">&bull;</span>
                </a>
                {% if theme.social.weibo %}
                <a class="social-link" title="weibo" href="{{ theme.social.weibo }}" target="_blank" rel="noopener">
                    {% include "public/icons/weibo.svg" %}
                </a>
                {% endif %}
                {% if theme.social.github %}
                <a class="social-link" title="github" href="{{ theme.social.github }}" target="_blank" rel="noopener">
                    {% include "public/icons/github.svg" %}
                </a>
                {% endif %}
                {% if theme.social.facebook %}
                <a class="social-link" title="facebook" href="{{ theme.social.facebook }}" target="_blank" rel="noopener">
                    {% include "public/icons/facebook.svg" %}
                </a>
                {% endif %}
                {% if theme.social.twitter %}
                <a class="social-link" title="twitter" href="{{ theme.social.twitter }}" target="_blank" rel="noopener">
                    {% include "public/icons/twitter.svg" %}
                </a>
                {% endif %}
                {% if theme.social.telegram %}
                <a class="social-link" title="telegram" href="{{ theme.social.telegram }}" target="_blank" rel="noopener">
                    {% include "public/icons/telegram.svg" %}
                </a>
                {% endif %}
                {% if theme.social.bilibili %}
                <a class="social-link" title="bilibili" href="{{ theme.social.bilibili }}" target="_blank" rel="noopener">
                    {% include "public/icons/bilibili.svg" %}
                </a>
                {% endif %}
                {% if theme.social.youtube %}
                <a class="social-link" title="youtube" href="{{ theme.social.youtube }}" target="_blank" rel="noopener">
                    {% include "public/icons/youtube.svg" %}
                </a>
                {% endif %}
            </div>
        </div>
    </div>
</header>
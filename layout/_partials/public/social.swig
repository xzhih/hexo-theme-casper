{# 社交连接 #}
<div class="social-links" {% if url_for(page.path) === theme.menu.ABOUT+'/index.html' %} style="display: none;" {% endif %}>
    {% if theme.social.weibo %}
    <a class="social-link" title="weibo" href="{{ theme.social.weibo }}" target="_blank" rel="noopener">
        {% include "icons/weibo.svg" %}
    </a>
    {% endif %}
    {% if theme.social.github %}
    <a class="social-link" title="github" href="{{ theme.social.github }}" target="_blank" rel="noopener">
        {% include "icons/github.svg" %}
    </a>
    {% endif %}
    {% if theme.social.facebook %}
    <a class="social-link" title="facebook" href="{{ theme.social.facebook }}" target="_blank" rel="noopener">
        {% include "icons/facebook.svg" %}
    </a>
    {% endif %}
    {% if theme.social.twitter %}
    <a class="social-link" title="twitter" href="{{ theme.social.twitter }}" target="_blank" rel="noopener">
        {% include "icons/twitter.svg" %}
    </a>
    {% endif %}
    {% if theme.social.telegram %}
    <a class="social-link" title="telegram" href="{{ theme.social.telegram }}" target="_blank" rel="noopener">
        {% include "icons/telegram.svg" %}
    </a>
    {% endif %}
    {% if theme.social.bilibili %}
    <a class="social-link" title="bilibili" href="{{ theme.social.bilibili }}" target="_blank" rel="noopener">
        {% include "icons/bilibili.svg" %}
    </a>
    {% endif %}
    {% if theme.social.youtube %}
    <a class="social-link" title="youtube" href="{{ theme.social.youtube }}" target="_blank" rel="noopener">
        {% include "icons/youtube.svg" %}
    </a>
    {% endif %}
</div>
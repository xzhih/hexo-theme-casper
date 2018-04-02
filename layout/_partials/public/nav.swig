{# NAV 导航部分, 遍历主题配置文件中的 menu 生成 link #}
<nav class="site-nav"> 
    <div class="site-nav-left">
        <ul class="nav">
            <li>
                {% if theme.blog_logo %}
                {% if not is_home() %}
                <a class="site-nav-logo" href="{{ config.root }}"  title="Home">
                    <img src="{{ theme.blog_logo }}" alt="{{ config.title }}" />
                </a>
                {% endif %}
                {% else %}
                <a href="{{ config.root }}" title="Home">{{ __('home') }}</a>
                {% endif %}
            </li>
            {% if theme.menu %}
            {% for menu,link in theme.menu %}
            <li>
                <a href="{{ link }}" title="{{ menu }}">{{ menu }}</a>
            </li>
            {% endfor %}
            {% endif %}
        </ul> 
    </div>
    <div class="site-nav-right">
        {% include 'social.swig' %}
    </div>
</nav>
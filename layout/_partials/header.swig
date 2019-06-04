{# header 部分, 控制页面中显示头部图像、标题 #}
{# 非文章页面 header 显示 cover_img #}
{% if not is_post() %}
<header class="site-header outer {% if !theme.header_image %}no-cover"{% else %}" style="background-image: url({{ theme.header_image }})"{% endif %}>
    <div class="inner">
        {# 非首页, 导航栏在顶部 #}
        {% if not is_home() %}
        {% include 'public/nav.swig' %}
        {% endif %}
        <div class="site-header-content">
            {% if is_home() and theme.blog_logo %}
            <img class="author-profile-image" src="{{ theme.blog_logo }}" alt="{{ title }}" />
            {% endif %}
            <h1 class="site-title">
                {{ title }}
            </h1>
            <h2 class="site-description">{{ description }}</h2>
        </div>
        {# 首页, 导航栏在header底部 #}
        {% if is_home() %}
        {% include 'public/nav.swig' %}
        {% endif %}
    </div>
</header>
{% else %}
{# 文章页只显示导航 #}
<header class="site-header post-site-header outer">
    <div class="inner">
        {% include 'public/nav.swig' %}
    </div>
</header>
{% endif %}
{# 插件 - 最近文章 #}
{% if site.posts.length %}
<article class="read-next-card" {% if theme.header_image %} style="background-image: url({{ theme.header_image }})" {% endif %} >
  <header class="read-next-card-header">
    <small class="read-next-card-header-sitetitle">&mdash; {{ config.title }} &mdash;</small>
    <h3 class="read-next-card-header-title">{{ __('recent_posts') }}</h3>
  </header>
  <div class="read-next-divider">
    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
      <path d="M13 14.5s2 3 5 3 5.5-2.463 5.5-5.5S21 6.5 18 6.5c-5 0-7 11-12 11C2.962 17.5.5 15.037.5 12S3 6.5 6 6.5s4.5 3.5 4.5 3.5"/>
    </svg>
  </div>
  <div class="read-next-card-content">
    <ul>
      {% set recent = site.posts.sort('date', -1) %}
      {% for post in recent %}
      {% if loop.key < 3 %}
      <li>
        <a href="{{ url_for(post.path) }}">{{ post.title }}</a>
      </li>
      {% endif %}
      {% endfor %}
    </ul>
  </div>
  <footer class="read-next-card-footer">
    <a href="{{ url_for('/archives') }}">  MORE  → </a>
  </footer>
</article>
{% endif %}
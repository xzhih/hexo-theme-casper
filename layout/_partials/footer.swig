{# footer #}

{% include "search.swig" %}
<footer class="site-footer outer">
	<div class="site-footer-content inner">
		<div class="copyright">
			<a href="{{ config.root }}" title="{{ config.title }}">{{ config.title }} &copy; {{ date(Date.now(), 'YYYY') }}</a>
			{% if is_post() %}
				{% if theme.comment and theme.valine.visitor %}
			        <span hidden="true" id="{{ url_for(page.path) }}" class="leancloud-visitors" data-flag-title="{{ page.title }}">
			            <span>阅读量 </span>
			            <span class="leancloud-visitors-count">0</span>
			        </span>
	    		{% endif %}
    		{% endif %}
		</div>
		<nav class="site-footer-nav">
			{% for key,link in theme.footer %}
			<a href="{{ link }}" title="{{ key }}" target="_blank" rel="noopener">{{ key }}</a>
			{% endfor %}
			{{ link_to('https://hexo.io', 'Hexo', {external: true})}}
			{{ link_to('https://github.com/xzhih/hexo-theme-casper', 'Casper', {external: true})}}
		</nav>
	</div>
</footer>
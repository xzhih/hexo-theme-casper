{# 关于页面 #}
{% macro tpl() %}
<main id="site-main" class="site-main outer" role="main">
	<div class="inner">
		<section class="post-full-content">
            <div id="lightgallery" class="markdown-body">
                {{ page.content }}
            </div>
        </section>
	</div>
	{% include 'public/pagination.swig' %}
    {% if theme.comment %}
    <div class="inner">
        <div id="comment"></div>
    </div>
    {% endif %}
</main>
{% endmacro %}
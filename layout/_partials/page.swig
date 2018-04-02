{% macro tpl() %}
<main id="site-main" class="site-main outer" role="main" style="padding-top: 4vw">
    <div class="inner">
        <article class="post-full no-image">
            <section class="post-full-content">
                <div id="lightgallery" class="markdown-body">
                    {{ page.content }}
                </div>
            </section>
        </article>
    </div>
</main>
{% endmacro %}
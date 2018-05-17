{% macro tpl() %}
<main id="site-main" class="site-main outer" role="main">
	<div class="inner">
		<div class="post-feed">
			<article class="post-card post no-image">
				<article class="post-full no-image">
					<section class="post-full-content" style="padding: 4vw">
						<div id="lightgallery" class="markdown-body">
							{{ page.content }}
						</div>
					</section>
				</article>
			</article>
		</div>
	</div>
</main>
{% endmacro %}
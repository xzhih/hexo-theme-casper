/*
* @Author: xzhih
* @Date:   2018-10-28 22:17:29
* @Last Modified by:   xzhih
* @Last Modified time: 2018-10-29 03:47:24
*/

// hexo.log.warn()

hexo.extend.generator.register('json', locals => {

	if (!hexo.theme.config.local_search) {
		return
	}

	'use strict'
	var config = hexo.config
	var posts = locals.posts.sort('-date')
	var res = []
	var index = 0

	if (posts) {
		posts.each(post => {
			var tempPost = {}
			if (post.title) {
				tempPost.title = post.title
			}
			if (post.path) {
				tempPost.url = config.root + post.path
			}
			if (post._content) {
				tempPost.content = post._content
			}
			if (post.tags && post.tags.length > 0) {
				var tags = []
				post.tags.forEach(tag => {
					tags.push(tag.name)
				})
				tempPost.tags = tags
			}
			if (post.categories && post.categories.length > 0) {
				var categories = []
				post.categories.forEach(cate => {
					categories.push(cate.name)
				})
				tempPost.categories = categories
			}
			res[index] = tempPost
			index += 1
		})
	}

	return [{
		path: 'searchData.json',
		data: JSON.stringify(res)
	},
	{
		path: 'searchVersion.txt',
		data: +new Date() + ''
	}
	]
})

hexo.extend.filter.register('after_generate', () => {

	if (!hexo.theme.config.lightgallery && !hexo.theme.config.lazyload) {
		return
	}

	'use strict'
	const route = hexo.route;
	const cheerio = require('cheerio')
	var routes = route.list().filter(path => path.endsWith(".html"));
	const map = routes.map(path => {
		return new Promise((resolve, reject) => {
			const html = route.get(path);
			let htmlTxt = "";
			html.on("data", chunk => (htmlTxt += chunk));
			html.on("end", () => {
				const $ = cheerio.load(htmlTxt, { decodeEntities: false });
				var postImg = $('#lightgallery').find('img')
				postImg.addClass('post-img')
				postImg.each(function () {
					var imgSrc = $(this).attr('src');
					$(this).attr('data-src', imgSrc)
					if (hexo.theme.config.lazyload) {
						$(this).addClass('b-lazy');
						$(this).attr('src', 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==')
					}
				})
				resolve({ path, html: $.html() });
			});
		});
	});

	return Promise.all(map).then(res =>
		res.map(obj => {
			route.set(obj.path, obj.html);
		})
		);

})

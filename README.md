hexo-theme-casper
===

A new [Ghost's Casper theme](https://github.com/TryGhost/Casper) port to [Hexo](https://hexo.io).

DEMO [here](https://xzhih.github.io/hexo-theme-casper/)

This is a simple and beautiful hexo theme.

When I was searching `beautiful hexo themes`, I saw the old version of Casper port to Hexo, but the latest not. So I decided that I would port it.

[中文版安装说明](https://zhih.me/hexo-casper-usage/)

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [Features](#features)
- [Installation](#installation)
- [Configuration](#configuration)
- [Copyright & License](#copyright--license)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

![hexo-theme-casper.jpg](https://i.loli.net/2017/11/26/5a19dd5331bea.jpg)

## Features

- Posts cover image
- Posts feature image
- Customized navigation menu 
- Customized favicon, logo, header image, author image
- Social links ( now support FB, TT ) 
- 3 widgets ( I think no need more )
- Tag, Category, TOC 
- Pagination
- Syntax Highlighting ( use [highlight.js](https://highlightjs.org) github style )
- Responsive Web Design
- valine comment
- chrome Nav Color
- Baidu Push
- Google Analytics
- SEO

## Installation

**Install**

```
$ git clone https://github.com/xzhih/hexo-theme-casper.git themes/hexo-casper
```

**Enable**

Modify `theme` in `_config.yml` to `hexo-casper` .

**Update**

You'd better backup old file first.

```
$ cd themes/casper 
$ git pull
```

**Front-matter**

Add to `scaffolds/post.md`, 

```
cover_img:     # show in home page, the post card header
feature_img:   # show in post page, content header
description: 
keywords: 
```

**valine comment**

[https://valine.js.org](https://valine.js.org)

**PS: Add about page**

```
$ hexo new page about
```


## Configuration

Edit `themes/hexo-casper/_config.yml` and set up what you want to show

```yaml
# config
rss:            # link
favicon: https://i.loli.net/2017/11/26/5a19c0b50432e.png
blog_logo: 
header_image: https://i.loli.net/2017/11/26/5a19c56faa29f.jpg
bio: This is a demo
post_toc: true

# keywords
keywords: hexo, casper, ghost, theme

# menu
menu:
  About: /about
  Archives: /archives
  # you can add here

# author
author_image:   # link
author_bio: 
author_location: 

# Social Links
social:
  weibo: https://weibo.com/xzhih
  github: https://github.com/xzhih
  twitter: https://twitter.com
  facebook: https://facebook
  telegram:
  # You only can use that I have added, I will keep adding

# Footer Links
footer_text: 
  # title: link
  # 粤ICP备xxxxxxx号-x: http://www.miitbeian.gov.cn
  # 粤公网安备xxxxxxx号: http://www.beian.gov.cn

# widget
widgets:
  recent_posts: true
  category: true
  tagcloud: true
  # This is a simple theme, I think 3 is enough.

# gallery
# https://github.com/sachinchoolur/lightgallery.js
lightgallery: true

# comment
# https://valine.js.org
comment: false
valine:
  notify: false # mail notifier , https://github.com/xCss/Valine/wiki 
  verify: false # Verification code
  appId: # your leancloud application appid
  appKey: # your leancloud application appkey
  placeholder: Just go go # comment box placeholder
  pageSize: 10 # pagination size
  avatar: mm # gravatar style

# PWA
# you need create a manifest.json file in hexo's source folder
manifest: false

navColor: '3c484e'

# Baidu Push
baidu: false

# Google Analytics
googleAnalytics: false
GA_TRACKING_ID: UA-XXXXXXXXXX-1

# Your Own CDN Links
# if you don't need the default cdn links, just delete, this theme will get files from source  
CDN: 
  jquery: https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js
  highlightjs: https://cdn.staticfile.org/highlight.js/9.10.0/highlight.min.js
  lightgalleryjs: https://cdn.staticfile.org/lightgallery/1.3.9/js/lightgallery.min.js
  lightgallerycss: https://cdn.staticfile.org/lightgallery/1.3.9/css/lightgallery.min.css

```

## Contributor

[batkiz](https://github.com/xzhih/hexo-theme-casper/commits?author=batkiz)

## [Copyright & License](https://github.com/TryGhost/Casper/blob/master/LICENSE)

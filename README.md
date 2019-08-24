hexo-theme-casper
===

A new [Ghost's Casper theme](https://github.com/TryGhost/Casper) port to [Hexo](https://hexo.io).

DEMO [here](https://xzhih.github.io/hexo-theme-casper/)

My Blog [zhih.me](https://zhih.me/)

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

![hexo-theme-casper.jpg](https://i.loli.net/2018/11/05/5be0665656ea9.jpg)

## Features

- Posts cover image
- Posts feature image
- Customized navigation menu 
- Customized favicon, logo, header image, author image
- Social links ( now support FB, TT、github、bilibili、YouTube、weibo) 
- 3 widgets ( I think no need more )
- Tag, Category, TOC 
- Pagination
- Syntax Highlighting 
- Responsive Web Design
- Lazy load
- Local search
- Valine comment
- Chrome Nav Color
- Baidu Push Google Analytics
- Service Worker
- MacOS、IOS and Android dark mode (Safari、Chrome)

## Installation

**Install**

```
git clone https://github.com/xzhih/hexo-theme-casper.git themes/hexo-casper
```

**Enable**

Modify `theme` in `_config.yml` to `hexo-casper` .

**Update**

You'd better backup old file first.

```
cd themes/casper 
git pull
```

**Front-matter**

Add to `scaffolds/post.md`, 

```
cover_img:     # show in home page, the post card header
feature_img:   # show in post page, content header
description: 
keywords: 
```

**Valine comment**

[https://valine.js.org](https://valine.js.org)

**PS: Add about page**

```
hexo new page about
```

## Configuration

Edit `themes/hexo-casper/_config.yml` and set up what you want to show

```yaml
# Config
rss:            # link
favicon: https://i.loli.net/2017/11/26/5a19c0b50432e.png
blog_logo: 
header_image: https://i.loli.net/2017/11/26/5a19c56faa29f.jpg
bio: This is a demo
post_toc: true

# Keywords
keywords: hexo, casper, ghost, theme

# Menu
menu:
  ABOUT: /about
  ARCHIVES: /archives
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
  bilibili: 
  youtube: 
  # You only can use that I have added, I will keep adding

# Footer Links
footer_text: 
  # title: link
  # 粤ICP备xxxxxxx号-x: http://www.miitbeian.gov.cn
  # 粤公网安备xxxxxxx号: http://www.beian.gov.cn

# Widget
widgets:
  recent_posts: true
  category: true
  tagcloud: true
  # This is a simple theme, I think 3 is enough.

# Gallery
# https://github.com/dimsemenov/PhotoSwipe
photoswipe: true

# LazyLoad
# home page has enabled, this value is to post page
# https://github.com/dinbror/blazy
lazyload: true

# Local Search
local_search: true

# Comment
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
  visitor: true # page view record

# PWA
# you need create a manifest.json file in hexo's source folder
manifest: false
service_workers: false

navColor: '3c484e'

# Baidu Push
baidu: false

# Google Analytics
googleAnalytics: false
GA_TRACKING_ID: UA-XXXXXXXXXX-1

```

### Local Search

https://github.com/wzpan/hexo-generator-search 

https://github.com/SuperKieran/hexo-generator-search-zip

## [Copyright & License](https://github.com/TryGhost/Casper/blob/master/LICENSE)

hexo-theme-casper
===

A new [Ghost's Casper theme](https://github.com/TryGhost/Casper) port to [Hexo](https://hexo.io).

DEMO [here](https://xzhih.github.io/hexo-theme-casper/)

This is a simple and beautiful hexo theme.

When I was searching `beautiful hexo themes`, I saw the old version of Casper port to Hexo, but the latest not. So I decided that I would port it.

[中文版安装说明](https://zhih.me/2017/hexo-casper-usage/)

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
```

**valine comment**

[https://valine.js.org](https://valine.js.org)

## Configuration

Edit `themes/hexo-casper/_config.yml` and set up what you want to show

```yaml
# config
rss:            # link
favicon:        # link
blog_logo:      # link
header_image: //demo.ghost.io/content/images/2017/07/blog-cover.jpg 

# menu
menu:
  About: /about
  Archives: /archives
  # you can add here

# author
author_image:   # link

# Social Links
social:
  facebook: https://www.facebook.com
  twitter: https://www.twitter.com
  # You only can use that I have added, I will keep adding

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

chromeNavColor: 3c484e

# Baidu Push
baidu: false

# Google Analytics
googleAnalytics: false
GA_TRACKING_ID: UA-XXXXXXXXXX-1

# MathJax support
mathjax: false
```

## [Copyright & License](https://github.com/TryGhost/Casper/blob/master/LICENSE)

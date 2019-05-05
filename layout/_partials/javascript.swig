{# javascript #}
{% if theme.service_workers %}
<script>
    if ('serviceWorker' in navigator) {
        window.addEventListener('load', function() {
            navigator.serviceWorker.register('/sw.js').then(function(registration) {
                console.log('ServiceWorker registration successful with scope: ', registration.scope);
            }).catch(function(err) {
                console.log('ServiceWorker registration failed: ', err);
            });
        });
    }
</script>
{% else %}
{# 卸载时为 unregister #}
<script>
    if(window.navigator && navigator.serviceWorker) {
        navigator.serviceWorker.getRegistrations()
        .then(function(registrations) {
            for(let registration of registrations) {
                registration.unregister();
            }
        });
    }
</script>
{% endif %}

{# 非文章页懒加载 #}
{% if !is_post() %}
{% if theme.local_search %}
{{ js('js/mix/home-lazy-local.min') }}
{% else %}
{{ js('js/lazyload') }}
{% endif %}
<script>;(function() {var bLazy = new Blazy()})();</script>
{% endif %}

{# 文章页面 #}
{% if is_post() %}
{% include "public/float-header.swig" %}

{# 如果开启文章页懒加载 #}
{% if theme.lazyload %}
{# 如果开启搜索，则引入 post 页面、懒加载、搜索合并文件 #}
{% if theme.local_search %}
{{ js('js/mix/post-lazy-local.min') }}
{% else %}
{# 未开启搜索只引入 post 页面、懒加载合并文件 #}
{{ js('js/mix/post-lazy.min') }}
{% endif %}
<script>;(function() {var bLazy = new Blazy()})();</script>
{% else %}
{# 如果未开启文章页懒加载 #}
{% if theme.local_search %}
{# 如果开启搜索，则引入 post 页面、搜索合并文件 #}
{{ js('js/mix/post-local.min') }}
{% else %}
{# 如果未开启懒加载，未开启搜索，则只引入 post 文件 #}
{{ js('js/post.min') }}
{% endif %}
{% endif %}

{# 相册 #}
{% if theme.lightgallery %}
{{ js('js/lightgallery.min') }}
{{ css('css/lightgallery.min') }}
<script>
    lightGallery(document.getElementById('lightgallery'), {
        selector: '.post-img'
    });
</script>
{% endif %}

{# Valine 评论 #}
{% if theme.comment %}
<script src="//cdn1.lncld.net/static/js/3.0.4/av-min.js"></script>
<script src='//unpkg.com/valine/dist/Valine.min.js'></script>
<script>
    new Valine({
        el: '#comment' ,
        verify: {{ theme.valine.verify }},
        notify: {{ theme.valine.notify }},
        appId: '{{ theme.valine.appId }}',
        appKey: '{{ theme.valine.appKey }}',
        placeholder: '{{ theme.valine.placeholder }}',
        pageSize: {{ theme.valine.pageSize }},
        avatar: '{{ theme.valine.avatar }}',
        visitor: true,
    });
</script>
{% endif %}
{% endif %}

{# 本地搜索 #}
{% if theme.local_search %}
{% if theme.service_workers %}
<script>searchFuncSW("{{ config.root }}")</script>
{% else %}
<script>searchFunc("{{ config.root }}")</script>
{% endif %}
{% endif %}

{# 百度 SEO #}
{% if theme.baidu %}
<script>
    (function(){
        var bp = document.createElement('script');
        var curProtocol = window.location.protocol.split(':')[0];
        if (curProtocol === 'https') {
            bp.src = 'https://zz.bdstatic.com/linksubmit/push.js';
        }
        else {
            bp.src = 'http://push.zhanzhang.baidu.com/push.js';
        }
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(bp, s);
    })();
    console.log("this theme is from https://github.com/xzhih/hexo-theme-casper")
</script>
{% endif %}

{% if is_post() && theme.prismjs %}
<script src="https://cdnjs.cloudflare.com/ajax/libs/prism/1.16.0/components/prism-core.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/prism/1.16.0/components/prism-clike.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/prism/1.16.0/components/prism-csharp.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/prism/1.16.0/components/prism-javascript.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/prism/1.16.0/components/prism-css.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/prism/1.16.0/components/prism-typescript.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/prism/1.16.0/components/prism-yaml.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/prism/1.16.0/components/prism-markup.min.js"></script>
{% endif %}


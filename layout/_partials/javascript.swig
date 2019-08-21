{# service workers #}
{% if theme.service_workers %}
<script>
    "serviceWorker"in navigator&&window.addEventListener("load",function(){
        navigator.serviceWorker.register("/sw.js")
            .then(function(e){
                console.log("ServiceWorker registration successful with scope: ",e.scope)
            })
            .catch(function(e){
                console.log("ServiceWorker registration failed: ",e)
            })
    });
</script>
{% else %}
{# 卸载时为 unregister #}
<script>
    if(window.navigator && navigator.serviceWorker) {
        navigator.serviceWorker.getRegistrations().then(function(registrations) {
            for(let registration of registrations) {
                registration.unregister()
            }
        })
    }
</script>
{% endif %}

<script id="scriptLoad" src="{{ url_for('/js/allinone.min.js') }}" async></script>

{# 非文章页懒加载 #}
{% if !is_post() %}
<script>
    document.getElementById('scriptLoad').addEventListener('load', function () {
        var bLazy = new Blazy()
    })
</script>
{% endif %}

{# 文章页懒加载 #}
{% if is_post() and theme.lazyload %}
<script>
    document.getElementById('scriptLoad').addEventListener('load', function () {
        var bLazy = new Blazy()
    })
</script>
{% endif %}

{# 文章页浮动顶栏 #}
{% if is_post() and theme.floadheader %}
{% include "public/fload-header.swig" %}
<script>
    document.getElementById('scriptLoad').addEventListener('load', function () {
        postProgressBar()
    })
</script>
{% endif %}

{# 相册 #}
{% if is_post() and theme.lightgallery %}
{{ js('js/lightgallery.min') }}
{{ css('css/lightgallery.min') }}
<script>
    lightGallery(document.getElementById('lightgallery'), {
        selector: '.post-img'
    });
</script>
{% endif %}

{# Valine 评论 #}
{% if is_post() and theme.comment %}
<script id="valineScript" src='//unpkg.com/valine/dist/Valine.min.js' async></script>
<script>
    document.getElementById('valineScript').addEventListener("load", function() {
        new Valine({
            el: '#comment' ,
            verify: {{ theme.valine.verify }},
            notify: {{ theme.valine.notify }},
            appId: '{{ theme.valine.appId }}',
            appKey: '{{ theme.valine.appKey }}',
            placeholder: '{{ theme.valine.placeholder }}',
            pageSize: {{ theme.valine.pageSize }},
            avatar: '{{ theme.valine.avatar }}',
            visitor: {{ theme.valine.visitor }}
        })
    });
</script>
{% endif %}

{# 本地搜索 #}
{% if theme.local_search %}
{% if theme.service_workers %}
<script>
    document.getElementById('scriptLoad').addEventListener('load', function(){
        searchFuncSW("{{ config.root }}")
    });
</script>
{% else %}
<script>
    document.getElementById('scriptLoad').addEventListener('load', function(){
        searchFunc("{{ config.root }}")
    });
</script>
{% endif %}
{% endif %}

{# 百度 SEO #}
{% if theme.baidu %}
<script>
    document.addEventListener('DOMContentLoaded',function(){
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
    });
</script>
{% endif %}

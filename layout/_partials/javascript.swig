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

{# 脚本加载监听 #}
<script>
    document.getElementById('scriptLoad').addEventListener('load', function () {
        {# 图片懒加载 #}
        {% if !is_post() || (is_post() && theme.lazyload) %}
            var bLazy = new Blazy();
        {% endif %}

        {# 文章页浮动顶栏 #}
        {% if is_post() && theme.floadheader %}
        {% include "public/fload-header.swig" %}
            postProgressBar();
        {% endif %}

        {# 本地搜索 #}
        {% if theme.local_search %}
        {% if theme.service_workers %}
            searchFuncSW("{{ config.root }}");
        {% else %}
            searchFunc("{{ config.root }}");
        {% endif %}
        {% endif %}
    })
</script>

{# 相册 #}
{% if (is_post() || is_page()) and theme.photoswipe %}
{{ css('photoswipe/photoswipe') }}
{{ css('photoswipe/default-skin/default-skin') }}
{{ js('photoswipe/photoswipe.min') }}
{{ js('photoswipe/photoswipe-ui-default.min.js') }}
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

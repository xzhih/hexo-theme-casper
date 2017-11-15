<div class="floating-header" >
    <div class="floating-header-logo">
        <a href="{{ config.root }}">
            {% if theme.blog_logo %}
                <img src="{{ theme.blog_logo }}" alt="{{ config.title }} icon" />
            {% endif %}
            <span>{{ config.title }}</span>
        </a>
    </div>
    <span class="floating-header-divider">&mdash;</span>
    <div class="floating-header-title">{{ title }}</div>
    <div class="floating-header-share">
        <div class="floating-header-share-label">Share this </div>
        <a class="floating-header-share-tw" href="">
            
        </a>
        <a class="floating-header-share-fb" href="">
        </a>
    </div>
    <progress class="progress" value="0">
        <div class="progress-container">
            <span class="progress-bar"></span>
        </div>
    </progress>
</div>

<script>
    $(document).ready(function () {
        var progressBar = document.querySelector('progress');
        var header = document.querySelector('.floating-header');
        var title = document.querySelector('.post-full-title');
        var lastScrollY = window.scrollY;
        var lastWindowHeight = window.innerHeight;
        var lastDocumentHeight = $(document).height();
        var ticking = false;

        function onScroll() {
            lastScrollY = window.scrollY;
            requestTick();
        }
        function onResize() {
            lastWindowHeight = window.innerHeight;
            lastDocumentHeight = $(document).height();
            requestTick();
        }
        function requestTick() {
            if (!ticking) {
                requestAnimationFrame(update);
            }
            ticking = true;
        }
        function update() {
            var rect = title.getBoundingClientRect();
            var trigger = rect.top + window.scrollY;
            var triggerOffset = title.offsetHeight + 35;
            var progressMax = lastDocumentHeight - lastWindowHeight;
            // show/hide floating header
            if (lastScrollY >= trigger + triggerOffset) {
                header.classList.add('floating-active');
            } else {
                header.classList.remove('floating-active');
            }
            progressBar.setAttribute('max', progressMax);
            progressBar.setAttribute('value', lastScrollY);
            ticking = false;
        }
        window.addEventListener('scroll', onScroll, {passive: true});
        window.addEventListener('resize', onResize, false);
        update();
    });
</script>
<!DOCTYPE html>
<html lang="{{ config.language }}">
{% include '_partials/head.swig' %}
<body class="{{ body_class }}">
	<div class="site-wrapper">
		{% block content %} {% endblock %}
	</div>
	{% include "_partials/widget.swig" %}
	{% include '_partials/footer.swig' %}
	{% include "_partials/javascript.swig" %}
</body>
</html>

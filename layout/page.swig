{% extends '_layout.swig' %}
{% import '_partials/page.swig' as template %}
{% block content %}
{% if url_for(page.path) === theme.menu.ABOUT+'/index.html' %}
{% include "_partials/about.swig" %}
{% else %}
{% include '_partials/header.swig' %}
{% endif %}
{{ template.tpl() }}
{% endblock %}
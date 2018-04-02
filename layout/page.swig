{% extends '_layout.swig' %}
{% import '_partials/page.swig' as template %}
{% block content %}
{% include '_partials/header.swig' %}
{{ template.tpl() }}
{% endblock %}
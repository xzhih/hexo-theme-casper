{# page #}
{% extends '_layout.swig' %}
{% import '_partials/page.swig' as template %}
{% block content %}
{% set description = config.description %}
{% include '_partials/header.swig' %}
{{ template.tpl() }}
{% endblock %}
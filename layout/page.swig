{# page #}
{% extends '_layout.swig' %}
{% import '_partials/index.swig' as template %}

{% block content %}

{% set description = config.description %}
{% include '_partials/header.swig' %}

{{ template.tpl() }}

{% endblock %}
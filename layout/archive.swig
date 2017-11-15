{# 归档 #}
{% extends '_layout.swig' %}
{% import '_partials/index.swig' as template %}
{% block content %}
{% set description = _p('total', site.posts.length) %}
{% include '_partials/header.swig' %}
{{ template.tpl() }}
{% endblock %}
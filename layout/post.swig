{# 文章页 #}
{% extends '_layout.swig' %}
{% import '_partials/post.swig' as template %}
{% block content %}
{% include '_partials/header.swig' %}
{{ template.tpl() }}
{% endblock %}
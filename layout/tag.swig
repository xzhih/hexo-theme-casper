{# 标签归档 #}
{% extends '_layout.swig' %}
{% import '_partials/index.swig' as template %}
{% block content %} 
{% set description = __('tags') %}
{% include '_partials/header.swig' %}
{{ template.tpl() }}
{% endblock %}
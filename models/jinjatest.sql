{# This is for Jinjatest #}
{{ config(materialized = 'ephemeral') }}

{% set dict = [('blabla', 1, 3), ('blabl2', 3, 6)] %}
{% for i1, i2, i3 in dict %}
    SELECT '{{ i1 }}' AS name, {{ i2 }} AS value1, {{ i3 }} AS value2
    {% if not loop.last %}
    UNION
    {% endif %}
{% endfor %}

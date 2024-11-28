{% macro multiply_n(column_name,n=2) %}

    {{column_name}}*{{n}}

{% endmacro %}
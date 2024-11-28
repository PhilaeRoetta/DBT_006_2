{% macro increment_macro(input_model,column_incr)%}

{%if is_incremental() %}
with model_max as
(
        SELECT 
            MAX({{column_incr}}) AS MAX_VALUE
        FROM
            {{this}}
    
)
{% endif %}
    SELECT
        *
    FROM
        {{input_model}}
    {% if is_incremental() %}
    WHERE
        {{column_incr}} > (SELECT MAX_VALUE FROM model_max)
    {% endif %}
{% endmacro %}
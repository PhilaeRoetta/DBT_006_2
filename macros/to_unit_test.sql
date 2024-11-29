{% macro to_unittest(classic_input,seed_input)%}

    {% if var('to_test',false) == true %}
        {{seed_input}}
    {% else %}
        {{classic_input}}
    {% endif %}

{% endmacro %}
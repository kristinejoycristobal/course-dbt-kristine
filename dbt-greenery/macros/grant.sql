  {% macro grant(role) %}

    {% set sql %}
      grant usage on schema {{ schema }} to {{ role }};
      grant select on {{ this }} to {{ role }};
    {% endset %}

    {% set table = run_query(sql) %}

{% endmacro %}




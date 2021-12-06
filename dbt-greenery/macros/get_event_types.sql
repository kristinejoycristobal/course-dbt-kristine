{% macro get_event_types() %}
{{ return(["page_view", "add_to_cart", "delete_from_cart", "checkout", "package_shipped"]) }}
{% endmacro %}
# The name of this view in Looker is "Customers"
view: customers {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `dbt_amcewen.customers` ;;
  drill_fields: [customer_id]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: customer_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.customer_id ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "First Name" in Explore.

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: first_order {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.first_order_date ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension_group: most_recent_order {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.most_recent_order_date ;;
  }

  dimension: number_of_orders {
    type: number
    sql: ${TABLE}.number_of_orders ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_number_of_orders {
    type: sum
    sql: ${number_of_orders} ;;  }
  measure: average_number_of_orders {
    type: average
    sql: ${number_of_orders} ;;  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
	customer_id,
	last_name,
	first_name,
	downstream_tbl_d.count,
	downstream_tbl_e.count,
	customers_view.count,
	downstream_tbl_a.count,
	customers_snapshot.count,
	downstream_tbl_b.count,
	downstream_tbl_c.count,
	ge_temp_228949d7.count,
	ge_temp_b45b065f.count,
	ge_temp_8fb2843d.count,
	ge_temp_5d66d7f0.count,
	ge_temp_555dc50a.count,
	ge_temp_cb174db4.count,
	ge_temp_ecf399c4.count,
	ge_temp_f084c735.count,
	payments.count,
	stg_orders.count,
	stg_customers.count,
	table_from_procedure.count
	]
  }

}

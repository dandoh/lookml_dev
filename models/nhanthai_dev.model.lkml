# Define the database connection to be used for this model.
connection: "bigquery"

# include all the views
include: "/views/**/*.view.lkml"

# Datagroups define a caching policy for an Explore. To learn more,
# use the Quick Help panel on the right to see documentation.

datagroup: nhanthai_dev_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: nhanthai_dev_default_datagroup

# Explores allow you to join together different views (database tables) based on the
# relationships between fields. By joining a view into an Explore, you make those
# fields available to users for data analysis.
# Explores should be purpose-built for specific use cases.

# To see the Explore you’re building, navigate to the Explore menu and select an Explore under "Nhanthai Dev"

# To create more sophisticated Explores that involve multiple views, you can use the join parameter.
# Typically, join parameters require that you define the join type, join relationship, and a sql_on clause.
# Each joined view also needs to define a primary key.


explore: downstream_tbl_d {
  join: customers {
    type: left_outer
    sql_on: ${downstream_tbl_d.customer_id} = ${customers.customer_id} ;;
    relationship: many_to_one
  }
}

# explore: downstream_tbl_e {
#   join: customers {
#     type: left_outer
#     sql_on: ${downstream_tbl_e.customer_id} = ${customers.customer_id} ;;
#     relationship: many_to_one
#   }
# }

# explore: customers_view {
#   join: customers {
#     type: left_outer
#     sql_on: ${customers_view.customer_id} = ${customers.customer_id} ;;
#     relationship: many_to_one
#   }
# }

# explore: downstream_tbl_a {
#   join: customers {
#     type: left_outer
#     sql_on: ${downstream_tbl_a.customer_id} = ${customers.customer_id} ;;
#     relationship: many_to_one
#   }
# }

# explore: customers_snapshot {
#   join: customers {
#     type: left_outer
#     sql_on: ${customers_snapshot.customer_id} = ${customers.customer_id} ;;
#     relationship: many_to_one
#   }
# }

# explore: downstream_tbl_b {
#   join: customers {
#     type: left_outer
#     sql_on: ${downstream_tbl_b.customer_id} = ${customers.customer_id} ;;
#     relationship: many_to_one
#   }
# }

# explore: downstream_tbl_c {
#   join: customers {
#     type: left_outer
#     sql_on: ${downstream_tbl_c.customer_id} = ${customers.customer_id} ;;
#     relationship: many_to_one
#   }
# }

# explore: ge_temp_228949d7 {
#   join: customers {
#     type: left_outer
#     sql_on: ${ge_temp_228949d7.customer_id} = ${customers.customer_id} ;;
#     relationship: many_to_one
#   }
# }

# explore: ge_temp_b45b065f {
#   join: customers {
#     type: left_outer
#     sql_on: ${ge_temp_b45b065f.customer_id} = ${customers.customer_id} ;;
#     relationship: many_to_one
#   }
# }

# explore: ge_temp_8fb2843d {
#   join: customers {
#     type: left_outer
#     sql_on: ${ge_temp_8fb2843d.customer_id} = ${customers.customer_id} ;;
#     relationship: many_to_one
#   }
# }

# explore: ge_temp_5d66d7f0 {
#   join: customers {
#     type: left_outer
#     sql_on: ${ge_temp_5d66d7f0.customer_id} = ${customers.customer_id} ;;
#     relationship: many_to_one
#   }
# }

# explore: ge_temp_555dc50a {
#   join: customers {
#     type: left_outer
#     sql_on: ${ge_temp_555dc50a.customer_id} = ${customers.customer_id} ;;
#     relationship: many_to_one
#   }
# }

# explore: ge_temp_cb174db4 {
#   join: customers {
#     type: left_outer
#     sql_on: ${ge_temp_cb174db4.customer_id} = ${customers.customer_id} ;;
#     relationship: many_to_one
#   }
# }

# explore: ge_temp_ecf399c4 {
#   join: customers {
#     type: left_outer
#     sql_on: ${ge_temp_ecf399c4.customer_id} = ${customers.customer_id} ;;
#     relationship: many_to_one
#   }
# }

# explore: ge_temp_f084c735 {
#   join: customers {
#     type: left_outer
#     sql_on: ${ge_temp_f084c735.customer_id} = ${customers.customer_id} ;;
#     relationship: many_to_one
#   }
# }

# explore: metricflow_time_spine {}

# explore: my_first_dbt_model {}

# explore: payments {
#   join: customers {
#     type: left_outer
#     sql_on: ${payments.customer_id} = ${customers.customer_id} ;;
#     relationship: many_to_one
#   }
# }

# explore: stg_orders {
#   join: customers {
#     type: left_outer
#     sql_on: ${stg_orders.customer_id} = ${customers.customer_id} ;;
#     relationship: many_to_one
#   }
# }

# explore: stg_customers {
#   join: customers {
#     type: left_outer
#     sql_on: ${stg_customers.customer_id} = ${customers.customer_id} ;;
#     relationship: many_to_one
#   }
# }

# explore: my_second_dbt_model {}

# explore: table_from_procedure {
#   join: customers {
#     type: left_outer
#     sql_on: ${table_from_procedure.customer_id} = ${customers.customer_id} ;;
#     relationship: many_to_one
#   }
# }

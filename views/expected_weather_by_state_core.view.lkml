include: "//@{CONFIG_PROJECT_NAME}/expected_weather_by_state.view.lkml"

view: expected_weather_by_state {
  extends: [expected_weather_by_state_config]
}

view: expected_weather_by_state_core {
  derived_table: {
    explore_source: date_table {
      column: calendar_day_of_year {}
      column: average_min_temparature { field: weather.average_min_temparature }
      column: average_max_temparature { field: weather.average_max_temparature }
      column: state_fips { field: date_table.state_fips_code }
    }
    sql_trigger_value: SELECT CURRENT_DATE ;;
  }

  dimension: pk {
    type: string
    sql: concat(${calendar_day_of_year},${state_fips}) ;;
    primary_key: yes
  }

  dimension: calendar_day_of_year {
    hidden: yes
    label: "Calendar Calendar Day of Year"
    type: number
  }
  dimension: average_min_temparature {
    hidden: yes
#     value_format: "#,##0.0 " °F""
    type: number
  }
  dimension: average_max_temparature {
    hidden: yes
#     value_format: "#,##0.0 " °F""
    type: number
  }
#   dimension: state_name {
#     hidden: yes
#     label: "Location State Name"
#   }
  dimension: state_fips {
    hidden: yes
    label: "Location State Fips"
    type: number
  }

  dimension: average_temp {
    type: number
    sql:  (${average_min_temparature}+${average_max_temparature})/2 ;;
  }

  measure: forecasted_temperature {
    label: "Forecasted Temperature"
    type: average
    sql: ${average_temp};;
    value_format: "#,##0.0 \" °F\""
  }

}

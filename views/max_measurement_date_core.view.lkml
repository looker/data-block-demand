include: "//@{CONFIG_PROJECT_NAME}/views/max_measurement_date.view.lkml"

view: max_measurement_date {
  extends: [max_measurement_date_config]
}

view: max_measurement_date_core {
  derived_table: {
    explore_source: date_table {
      column: max_measurement_date { field: us_counties.max_measurement_date }
    }
    sql_trigger_value: SELECT CURRENT_DATE ;;
  }
  dimension: max_measurement_date {
    hidden: yes
    label: "Covid-19 Max Measurement Date"
    type: date
  }
}

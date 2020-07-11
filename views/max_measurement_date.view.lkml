# If necessary, uncomment the line below to include explore_source.
# include: "election_model.model.lkml"

view: max_measurement_date {
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

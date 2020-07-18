connection: "brick-layer"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project

persist_for: "48 hours"


explore: let_livestream {
  label: "Livestream Events Data"
}

explore: historical_sample {
  label: "Historical Events Data"
}

explore: date_table {
  from: fips_overlap
  group_label: "Google Demand"
  view_label: "Location"
  label: "Google Demand Event Data"

  # join: zip_timezone_map {
  #   view_label: "Location"
  #   type: left_outer
  #   sql_on: ${date_table.zip} = ${zip_timezone_map.zip} ;;
  #   relationship: many_to_one
  # }

  join: let_events {
    view_label: "Live Events"
    type: left_outer
    relationship: many_to_many
    sql_on: ${date_table.calendar_date} = ${let_events.local_event_datetime_date} AND ${date_table.area_name} = ${let_events.county_name};;
  }

#   join: livestream_clean {
#     view_label: "Livestream Events"
#     type: left_outer
#     relationship: one_to_many
#     sql_on: ${date_table.calendar_date} = ${livestream_clean.start_date} AND LOWER(TRIM(${zip_timezone_map.timezone})) = LOWER(TRIM(${livestream_clean.timezone}));;
#   }

  join: us_counties {
    view_label: "Covid-19"
    type: left_outer
    relationship: many_to_one
    sql_on: ${date_table.calendar_date} = ${us_counties.measurement_date} AND ${date_table.area_name} = ${us_counties.county} AND ${us_counties.pk} IS NOT NULL;;
  }

  join: mobility_data_core {
    view_label: "Mobility (US)"
    type: left_outer
    relationship: many_to_one
    sql_on:${date_table.calendar_date} = ${mobility_data_core.mobility_date} AND ${date_table.area_name} = ${mobility_data_core.sub_region_2} AND ${mobility_data_core.country_region} = 'United States' ;;
  }

  join: max_date_mobility {
    type: left_outer
    relationship: many_to_one
    view_label: "Mobility (US)"
    fields: [max_date_mobility.max_mobility_raw]
    sql_on: ${mobility_data_core.mobility_date} = ${max_date_mobility.max_mobility_raw} ;;
  }

  join: max_measurement_date {
    type: left_outer
    relationship: one_to_one
    sql_on: ${us_counties.measurement_date} = ${max_measurement_date.max_measurement_date} ;;
  }

  join: weather {
    view_label: "Weather"
    type: left_outer
    relationship: many_to_many
    sql_on: ${date_table.calendar_date} = ${weather.weather_date} AND ${date_table.area_name} = ${weather.county_lsad} ;;
  }

  join: expected_weather_by_state {
    view_label: "Weather"
    type: left_outer
    relationship: many_to_many
    sql_on: ${date_table.state_fips_code} = ${expected_weather_by_state.state_fips} AND CAST(${date_table.calendar_day_of_year} AS INT64) = ${expected_weather_by_state.calendar_day_of_year} ;;
  }

}

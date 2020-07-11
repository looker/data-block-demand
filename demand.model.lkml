connection: "looker-private-demo"
#connection: "lookerdata"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
include: "/faa/*.view.lkml"                  # include all views in the faa/ folder in this project
include: "/hotel/*.view.lkml"

persist_for: "48 hours"


explore: let_livestream {
  label: "Livestream Events Data"
}

explore: historical_sample {
  label: "Historical Events Data"
}

# explore: county_overlap {}

explore: flight_facts {}


explore: date_table {
  from: county_overlap
  group_label: "Google Demand"
  view_label: "Location"
  label: "Google Demand Event Data"


#   join: county_overlap {
#     view_label: "Location"
#     type: cross
#     relationship: many_to_many
#   }

  join: zip_timezone_map {
    view_label: "Location"
    type: left_outer
    sql_on: ${date_table.zip} = ${zip_timezone_map.zip} ;;
    relationship: many_to_one
  }

  join: let_events {
    view_label: "Live Events"
    type: left_outer
    relationship: many_to_many
    sql_on: ${date_table.calendar_date} = ${let_events.local_event_datetime_date} AND ${date_table.zip} = ${let_events.zip_code};;
  }

  join: livestream_clean {
    view_label: "Livestream Events"
    type: left_outer
    relationship: one_to_many
    sql_on: ${date_table.calendar_date} = ${livestream_clean.start_date} AND LOWER(TRIM(${zip_timezone_map.timezone})) = LOWER(TRIM(${livestream_clean.timezone}));;
  }

  join: us_counties {
    view_label: "Covid-19"
    type: left_outer
    relationship: many_to_one
    sql_on: ${date_table.calendar_date} = ${us_counties.measurement_date} AND ${date_table.county_geoid} = ${us_counties.fips} AND ${us_counties.pk} IS NOT NULL;;
  }

  join: mobility_data_core {
    view_label: "Mobility (US)"
    type: left_outer
    relationship: many_to_one
    sql_on:${date_table.calendar_date} = ${mobility_data_core.mobility_date} AND ${date_table.county_geoid} = ${mobility_data_core.sub_region_2_fips} AND ${mobility_data_core.country_region} = 'United States' ;;
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
    sql_on: ${date_table.calendar_date} = ${weather.weather_date} AND ${date_table.county_geoid} = ${weather.fips} ;;
  }

  join: expected_weather_by_state {
    view_label: "Weather"
    type: left_outer
    relationship: many_to_many
    sql_on: ${date_table.state_fips} = ${expected_weather_by_state.state_fips} AND CAST(${date_table.calendar_day_of_year} AS INT64) = ${expected_weather_by_state.calendar_day_of_year} ;;
  }

  join: flights_by_day_and_route {
    view_label: "Flights"
    type: left_outer
    relationship: many_to_many
    sql_on: ${date_table.calendar_date} = ${flights_by_day_and_route.dep_date} AND lower(trim(${date_table.state_abbr})) = lower(trim(${flights_by_day_and_route.destination_state})) ;;
  }


}


explore: flights {
  hidden: yes
  join: carriers {
    type: left_outer
    relationship: many_to_one
    sql_on: ${flights.carrier} = ${carriers.code} ;;
  }
  join: origin_airport {
    from: airports
    type: left_outer
    relationship: many_to_one
    sql_on: ${flights.origin} = ${origin_airport.code} ;;
  }
  join: destination_airport {
    from: airports
    type: left_outer
    relationship: many_to_one
    sql_on: ${flights.destination} = ${destination_airport.code} ;;
  }
  join: aircraft {
    type: left_outer
    relationship: many_to_one
    sql_on: ${flights.tail_num} = ${aircraft.tail_num} ;;
  }
  join: aircraft_models {
    type: left_outer
    relationship: many_to_one
    sql_on: ${aircraft.aircraft_model_code} = ${aircraft_models.aircraft_model_code} ;;
  }
  join: flight_pricing {
    view_label: "Flights"
    type: left_outer
    relationship: many_to_one
    sql_on: ${origin_airport.code} = ${flight_pricing.airport_code} ;;
  }
}


explore: date_table_hotel {
  extends: [date_table]
  view_name: date_table
  from: county_overlap
  group_label: "Google Demand - Hotel"
  view_label: "Location - Hotel"
  label: "Google Demand Event Data - Hotel"

  join: hotel_bookings {
    type: left_outer
    relationship: many_to_many
    sql_on: ${date_table.county_geoid} = cast( ${hotel_bookings.county_fips_code} as string)
      and  ${date_table.calendar_date} = ${hotel_bookings.arrival_date}  ;;
  }

  join: hotel_rooms {
    type: left_outer
    relationship: many_to_one
    sql_on: ${hotel_bookings.property_id} = ${hotel_rooms.property_id}  ;;
  }

  join: room_facts {
    type: left_outer
    relationship: many_to_many
    sql_on: ${date_table.county_geoid} = ${room_facts.county_geoid}
      and ${date_table.calendar_date}  = ${room_facts.arrival_date};;

  }


}

#explore: hotel_bookings {}

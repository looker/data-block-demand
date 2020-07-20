include: "//@{CONFIG_PROJECT_NAME}/us_counties.view.lkml"

view: us_counties {
  extends: [us_counties_config]
}

view: us_counties_core {
  sql_table_name: `bigquery-public-data.covid19_nyt.us_counties`
    ;;

  dimension: pk {
    type: string
    hidden: yes
    # sql: CONCAT(${measurement_raw},${county},${fips_raw}) ;;
    sql: CONCAT(us_counties.date,us_counties.county,(CAST((CASE WHEN us_counties.county = 'New York City' THEN '36061'
                  WHEN us_counties.county = 'Kansas City' AND us_counties.state_name = 'Missouri' THEN '29095'
                  ELSE us_counties.county_fips_code END) as STRING)))  ;;
    primary_key: yes
  }

  dimension: confirmed_cases {
    hidden: yes
    type: number
    sql: ${TABLE}.confirmed_cases ;;
  }

  measure: total_confirmed_cases {
    type: sum
    sql: ${confirmed_cases} ;;
  }

  measure: max_confirmed_cases {
    type: sum
    sql: ${confirmed_cases} ;;
    filters: [is_max_measurement_date: "Yes"]
  }

  measure: average_confirmed_cases {
    type: average
    sql: ${confirmed_cases} ;;
    value_format_name: decimal_0
  }

  dimension: county {
    type: string
    sql: ${TABLE}.county ;;
  }

  dimension: fips_raw {
    hidden: yes
    type: string
    sql: CAST((CASE WHEN ${county} = 'New York City' THEN '36061'
                   WHEN ${county} = 'Kansas City' AND ${state_name} = 'Missouri' THEN '29095'
                   ELSE ${TABLE}.county_fips_code END) as STRING);;
    map_layer_name: us_counties_fips
  }

  dimension: fips {
    type: string
    sql: CASE WHEN LENGTH(${fips_raw})<5 THEN CONCAT('0',${fips_raw}) ELSE ${fips_raw} END;;
    map_layer_name: us_counties_fips
  }

  dimension_group: measurement {
    type: time
    timeframes: [raw,date]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date ;;
  }

  dimension: is_max_measurement_date {
    type: yesno
    sql: ${measurement_date} = ${max_measurement_date.max_measurement_date} ;;
  }

  measure: max_measurement_date {
    hidden: yes
    type: date
    sql: CAST(MAX(${measurement_raw}) AS TIMESTAMP) ;;
  }

  dimension: deaths {
    hidden: yes
    type: number
    sql: ${TABLE}.deaths ;;
  }

  measure: total_deaths {
    type: sum
    sql: ${deaths} ;;
  }

  measure: death_rate {
    type: number
    sql: 1.0*${total_deaths}/NULLIF(${total_confirmed_cases},0);;
    value_format_name: percent_2
  }

  dimension: state_name {
    hidden: yes
    type: string
    sql: ${TABLE}.state_name ;;
    map_layer_name: us_states
  }

}

view: fips_overlap {
#   sql_table_name: `bigquery-public-data.census_utility.fips_codes_all`;;
  derived_table: {
    sql: SELECT * FROM `bigquery-public-data.census_utility.fips_codes_all`
       CROSS JOIN (SELECT date_add(date_sub(date_trunc(CURRENT_DATE, year), interval 365 day), interval num day) AS day
                FROM  (
                    SELECT *
                    FROM   unnest(generate_array(0,(365*3))) AS num )  x) x ;;
    sql_trigger_value: SELECT date_trunc(CURRENT_DATE,month) ;;
  }

  dimension: primary_key {
    hidden: yes
    primary_key: yes
    type: string
    sql: concat(${area_name},${calendar_date}) ;;
  }

  dimension_group: calendar {
    view_label: "Calendar"
    timeframes: [date,week,month,day_of_year]
    type: time
    datatype: date
    sql: ${TABLE}.day ;;
  }

  dimension: is_future_date {
    view_label: "Calendar"
    type: yesno
    sql: ${calendar_date}>CURRENT_DATE ;;
  }

  dimension: area_name {
    type: string
    sql: ${TABLE}.area_name ;;
  }

  dimension: consolidated_city_fips_code {
    type: string
    sql: ${TABLE}.consolidated_city_fips_code ;;
  }

  dimension: county_fips_code {
    type: string
    sql: ${TABLE}.county_fips_code ;;
  }

  dimension: county_subdivision_fips_code {
    type: string
    sql: ${TABLE}.county_subdivision_fips_code ;;
  }

  dimension: place_fips_code {
    type: string
    sql: ${TABLE}.place_fips_code ;;
  }

  dimension: state_fips_code {
    type: string
    sql: ${TABLE}.state_fips_code ;;
  }

  dimension: summary_level {
    type: string
    sql: ${TABLE}.summary_level ;;
  }

  dimension: summary_level_name {
    type: string
    sql: ${TABLE}.summary_level_name ;;
  }

  measure: count {
    type: count
    drill_fields: [summary_level_name, area_name]
  }
}

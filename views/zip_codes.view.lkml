view: zip_codes {
#   sql_table_name: `bigquery-public-data.geo_us_boundaries.zip_codes`;;
  derived_table: {
    sql: SELECT * FROM `bigquery-public-data.geo_us_boundaries.zip_codes`
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
    sql: concat(${county},${zip_code},${calendar_date}) ;;
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

  dimension: area_land_meters {
    type: number
    sql: ${TABLE}.area_land_meters ;;
  }

  dimension: area_water_meters {
    type: number
    sql: ${TABLE}.area_water_meters ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: county {
    type: string
    sql: ${TABLE}.county ;;
  }

  dimension: fips_class_code {
    type: string
    sql: ${TABLE}.fips_class_code ;;
  }

  dimension: functional_status {
    type: string
    sql: ${TABLE}.functional_status ;;
  }

  dimension: internal_point_geom {
    type: string
    sql: ${TABLE}.internal_point_geom ;;
  }

  dimension: internal_point_lat {
    type: number
    sql: ${TABLE}.internal_point_lat ;;
  }

  dimension: internal_point_lon {
    type: number
    sql: ${TABLE}.internal_point_lon ;;
  }

  dimension: mtfcc_feature_class_code {
    type: string
    sql: ${TABLE}.mtfcc_feature_class_code ;;
  }

  dimension: state_code {
    type: string
    sql: ${TABLE}.state_code ;;
  }

  dimension: state_fips_code {
    type: string
    sql: ${TABLE}.state_fips_code ;;
  }

  dimension: state_name {
    type: string
    sql: ${TABLE}.state_name ;;
  }

  dimension: zip_code {
    type: zipcode
    sql: ${TABLE}.zip_code ;;
  }

  dimension: zip_code_geom {
    type: string
    sql: ${TABLE}.zip_code_geom ;;
  }

  measure: count {
    type: count
    drill_fields: [state_name]
  }
}

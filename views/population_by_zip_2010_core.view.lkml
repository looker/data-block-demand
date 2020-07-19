include: "//@{CONFIG_PROJECT_NAME}/population_by_zip_2010.view.lkml"

view: population_by_zip_2010 {
  extends: [population_by_zip_2010_config]
}

view: population_by_zip_2010_core {
  sql_table_name: `bigquery-public-data.census_bureau_usa.population_by_zip_2010`
    ;;

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: geo_id {
    type: string
    sql: ${TABLE}.geo_id ;;
  }

  dimension: maximum_age {
    type: number
    sql: ${TABLE}.maximum_age ;;
  }

  dimension: minimum_age {
    type: number
    sql: ${TABLE}.minimum_age ;;
  }

  dimension: population {
    type: number
    sql: ${TABLE}.population ;;
  }

  dimension: zipcode {
    type: zipcode
    sql: ${TABLE}.zipcode ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}

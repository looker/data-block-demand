include: "//@{CONFIG_PROJECT_NAME}/let_livestream.view.lkml"

view: let_livestream {
  extends: [let_livestream_config]
}

view: let_livestream_core {
  sql_table_name: `@{DEMAND_SCHEMA_NAME}.let_livestream`
    ;;

  dimension: artist {
    type: string
    sql: ${TABLE}.artist ;;
  }

  dimension: audience_size_index {
    type: string
    sql: ${TABLE}.audience_size_index ;;
  }

  dimension: categories {
    type: string
    sql: ${TABLE}.categories ;;
  }

  dimension: event_url {
    type: string
    sql: ${TABLE}.event_url ;;
  }

  dimension: genre {
    type: string
    sql: ${TABLE}.genre ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension_group: start {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.start_date ;;
  }

  dimension: timezone {
    type: string
    sql: ${TABLE}.timezone ;;
  }

  dimension: timezone_state {
    type: string
    sql: REPLACE(TRIM(SPLIT(${timezone},"/")[safe_ordinal(2)]),"_"," ")  ;;
  }

  dimension: venue {
    type: string
    sql: ${TABLE}.venue ;;
  }

  measure: count {
    type: count
    drill_fields: [name]
  }
}

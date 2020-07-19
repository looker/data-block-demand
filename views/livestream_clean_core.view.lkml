include: "//@{CONFIG_PROJECT_NAME}/livestream_clean.view.lkml"

view: livestream_clean {
  extends: [livestream_clean_config]
}

view: livestream_clean_core {
  derived_table: {
    sql: SELECT audience_size_index
      , event_url
      , venue
      , timezone
      , REPLACE(TRIM(SPLIT(timezone,"/")[safe_ordinal(1)]),"_"," ") as country
      , REPLACE(TRIM(SPLIT(timezone,"/")[safe_ordinal(2)]),"_"," ") as state
      , date(start_date) as start_date
      , array_agg(DISTINCT genre) as genres
      , array_agg(DISTINCT genre) as artists
      , array_agg(DISTINCT genre) as names
FROM `demand-public.let_looker.let_livestream`
WHERE event_url IS NOT NULL AND timezone NOT LIKE '%GMT%'
GROUP BY 1,2,3,4,5,6,7
 ;;
    sql_trigger_value: SELECT CURRENT_DATE ;;

  }

  dimension: primary_key {
    type: string
    hidden: yes
    primary_key: yes
    sql: CONCAT(${event_url},${start_date}) ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: audience_size_index {
    type: string
    sql: ${TABLE}.audience_size_index ;;
  }

  dimension: event_url {
    type: string
    sql: ${TABLE}.event_url ;;
  }

  dimension: venue {
    type: string
    sql: ${TABLE}.venue ;;
  }

  dimension: timezone {
    type: string
    sql: ${TABLE}.timezone ;;
  }

  dimension: country {
    type: string
    sql: ${TABLE}.country ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: start_date {
    type: date
    sql: ${TABLE}.start_date ;;
  }

  dimension: genres {
    type: string
    sql: ${TABLE}.genres ;;
  }

  dimension: artists {
    type: string
    sql: ${TABLE}.artists ;;
  }

  dimension: names {
    type: string
    sql: ${TABLE}.names ;;
  }

  set: detail {
    fields: [
      audience_size_index,
      event_url,
      venue,
      timezone,
      country,
      state,
      start_date,
      genres,
      artists,
      names
    ]
  }
}

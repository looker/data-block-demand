include: "//@{CONFIG_PROJECT_NAME}/date_table.view.lkml"

view: date_table {
  extends: [date_table_config]
}

view: date_table_core {
  derived_table: {
    sql: SELECT date_add(date_sub(date_trunc(CURRENT_DATE, year), interval 365 day), interval num day) AS day
                FROM  (
                    SELECT *
                    FROM   unnest(generate_array(0,(365*3))) AS num )  x
 ;;
    sql_trigger_value: SELECT CURRENT_DATE ;;
  }

  dimension: pk {
    type: string
    hidden: yes
    sql: CAST(${calendar_date} AS STRING) ;;
    primary_key: yes
  }

  dimension_group: calendar {
    timeframes: [date,week,month,day_of_year]
    type: time
    datatype: date
    sql: ${TABLE}.day ;;
  }

  dimension: is_future_date {
    type: yesno
    sql: ${calendar_date}>CURRENT_DATE ;;
  }

}

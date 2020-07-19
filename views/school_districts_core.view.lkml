include: "//@{CONFIG_PROJECT_NAME}/school_districts.view.lkml"

view: school_districts {
  extends: [school_districts_config]
}

view: school_districts_core {
  sql_table_name: `demand-public.let_looker.school_districts`
    ;;

  dimension_group: fall_start_2020 {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Fall_Start_2020 ;;
  }

  dimension_group: last_day_of_school_for_summer_2019 {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Last_Day_of_School_for_Summer_2019 ;;
  }

  dimension_group: last_day_of_school_for_summer_2020 {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Last_Day_of_School_for_Summer_2020 ;;
  }

  dimension: school_district_name {
    type: string
    sql: ${TABLE}.School_District_Name ;;
  }

  dimension_group: spring_break_end_2021 {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Spring_Break_End_2021 ;;
  }

  dimension_group: spring_break_start_2021 {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Spring_Break_Start_2021 ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.State ;;
  }

  dimension_group: winter_break_end_2021 {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Winter_Break_End_2021 ;;
  }

  dimension_group: winter_break_start_2020 {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Winter_Break_Start_2020 ;;
  }

  dimension_group: winter_ski_break_end_2021 {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Winter_Ski_Break_End_2021 ;;
  }

  dimension_group: winter_ski_break_start_2021 {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Winter_Ski_Break_Start_2021 ;;
  }

  measure: count {
    type: count
    drill_fields: [school_district_name]
  }
}

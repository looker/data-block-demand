view: max_date_mobility {
  derived_table: {
    sql: SELECT
            country_region_code
            , IFNULL(sub_region_1, '') as sub_region_1
            , IFNULL(sub_region_2, '') as sub_region_2
            , MAX(date) as max_mobility_date
            FROM
              `bigquery-public-data.covid19_google_mobility.mobility_report` m -- base mobility data
            WHERE
              {% condition mobility_data_core.mobility_date %} date {% endcondition %}
              AND
              {% condition date_table.calendar_date %} date {% endcondition %}
            GROUP BY 1, 2, 3
            ;;
  }

  dimension: pk {
    primary_key:yes
    hidden: yes
    type: string
    sql: concat(coalesce(${county},''), coalesce(${province_state},''), coalesce(${country_region_code},'')) ;;
  }

  dimension: county {
    sql: ${TABLE}.sub_region_2 ;;
    hidden:yes
  }

  dimension: province_state {
    sql: ${TABLE}.sub_region_1 ;;
    hidden:yes
  }

  dimension: country_region_code {hidden:yes}

  dimension_group: max_mobility {
    type: time
    hidden: yes
    timeframes: [raw,date]
    sql: ${TABLE}.max_mobility_date ;;
  }
}

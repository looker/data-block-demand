view: let_events {
  sql_table_name: `demand-public.let_looker.let_events`
    ;;
  drill_fields: [id]

  dimension: id {
    hidden: yes
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: address {
    hidden: yes
    type: string
    sql: ${TABLE}.address ;;
  }

  dimension: airport_codes {
    type: string
    sql: ${TABLE}.airport_codes ;;
  }

  dimension: county_name {
    type: string
    sql: ${TABLE}.county_name ;;
  }

  dimension: geo_interest {
    label: "Search Interest by Geo"
    type: string
    sql: ${TABLE}.geo_interest ;;
  }

  dimension: categories {
    label: "Category Hierarcy"
    group_label: "Category"
    type: string
    sql: REPLACE(${TABLE}.categories,',',' > ') ;;
  }

  dimension: top_tier_catgory {
    label: "Primary Category"
    group_label: "Category"
    type: string
    sql: TRIM(SPLIT(${categories},'>')[safe_ordinal(1)]) ;;
  }

  dimension_group: created {
    hidden: yes
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
    sql: ${TABLE}.created_date ;;
  }

  dimension: dma_name {
    label: "Market Area"
    type: string
    sql: ${TABLE}.dma_name ;;
  }

  dimension: estimated_audience_size {
    hidden: yes
    type: number
    sql: ${TABLE}.estimated_audience_size ;;
  }

  dimension: estimated_audience_size_tier {
    type: tier
    style: integer
    sql: ${estimated_audience_size} ;;
    tiers: [100,200,300,400,500]
  }

  dimension: holiday {
    type: string
    sql: ${TABLE}.holiday ;;
  }

  dimension_group: last_update {
    hidden: yes
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
    sql: ${TABLE}.last_update ;;
  }

  dimension_group: local_event_datetime {
    label: "Local Event Start"
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      week_of_year,
      month,
      month_name,
      month_num,
      quarter,
      year
    ]
    sql: CAST(${TABLE}.local_event_datetime AS TIMESTAMP) ;;
  }

  dimension_group: local_event_end_datetime {
    label: "Local Event End"
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      week_of_year,
      month,
      month_name,
      month_num,
      quarter,
      year
    ]
    sql: CAST(${TABLE}.local_event_end_datetime AS TIMESTAMP) ;;
  }

  dimension: city {
    type: string
    group_label: "Location"
    sql: ${TABLE}.city ;;
  }

  dimension: country {
    type: string
    group_label: "Location"
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }


  dimension: latitude {
    hidden: yes
    type: number
    group_label: "Location"
    sql: ${TABLE}.latitude ;;
  }

  dimension: longitude {
    hidden: yes
    type: number
    group_label: "Location"
    sql: ${TABLE}.longitude ;;
  }

  dimension: location {
    group_label: "Location"
    label: "Point Location"
    description: "Lat / Lon point location"
    type: location
    sql_latitude: ROUND(${latitude}, 1);;
    sql_longitude: ROUND(${longitude},1) ;;
  }

  dimension: province_state {
    hidden: yes
    group_label: "Location"
    #description: "Map only configured for US states, but states from other countries are also present in the data"
    label: "Location State"
    map_layer_name: us_states
    type: string
    sql: ${state} ;;
  }

  dimension: state {
    hidden: yes
    group_label: "Location"
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: zip_code {
    hidden: yes
    group_label: "Location"
    type: zipcode
    sql: ${TABLE}.zip_code ;;
    map_layer_name: us_zipcode_tabulation_areas
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
    drill_fields: [geo_interest]
    action: {
      label: "Launch Package Marketing Campaign..."
      url: "https://google.com"
      icon_url: "https://www.marketo.com/favicon.ico"
      form_param: {
        name: "Body"
        type: textarea
        label: "Body"
        default:
        "Hi Loyal Sky Airways Customer,
        Are you traveling to town to attend {{ name._value }}? Did you know we offer exclusive offers and packages for all {{ top_tier_catgory._value }} events? Contact us now or visit SkyAirways.com for more info!
        Best,
        The Sky Team
        "
      }
    }
  }


  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: is_active {
    type: yesno
    sql: ${status}='Active' ;;
  }

  dimension: time_zone {
    hidden: yes
    type: string
    sql: ${TABLE}.time_zone ;;
  }

  dimension: venue {
    type: string
    sql: ${TABLE}.venue ;;
  }

  dimension_group: version {
    hidden: yes
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
    sql: ${TABLE}.version ;;
  }

  measure: count {
    label: "Count of Events"
    type: count
    drill_fields: [details*]
  }


  measure: count_active {
    label: "Count of Active Events"
    type: count
    filters: [status: "Active"]
  }

  measure: count_cancelled {
    label: "Count of Cancelled Events"
    type: count
    filters: [status: "Cancelled"]
  }

  measure: cancellation_rate {
    label: "Cancellation Rate"
    type: number
    sql: 1.0*${count_cancelled}/NULLIF(${count},0) ;;
    value_format_name: percent_1
  }

  measure: total_estimated_audience_size {
    type: sum
    sql: ${estimated_audience_size} ;;
    value_format_name: decimal_0
    drill_fields: [details*]
    link: {
      label: "View Top Events"
      url: "{{link}}&fields=let_events.total_estimated_audience_size,let_events.name&f[date_table.calendar_date]=before+3+months+from+now&f[date_table.is_future_date]=Yes&f[let_events.status]=Active&sorts=let_events.total_estimated_audience_size+desc&limit=5&column_limit=50&vis=%7B%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Afalse%2C%22show_view_names%22%3Afalse%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Afalse%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22plot_size_by_field%22%3Afalse%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22limit_displayed_rows%22%3Afalse%2C%22legend_position%22%3A%22center%22%2C%22point_style%22%3A%22none%22%2C%22show_value_labels%22%3Atrue%2C%22label_density%22%3A25%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22ordering%22%3A%22none%22%2C%22show_null_labels%22%3Afalse%2C%22show_totals_labels%22%3Afalse%2C%22show_silhouette%22%3Afalse%2C%22totals_color%22%3A%22%23808080%22%2C%22color_application%22%3A%7B%22collection_id%22%3A%22google%22%2C%22palette_id%22%3A%22google-categorical-0%22%7D%2C%22y_axes%22%3A%5B%7B%22label%22%3A%22%22%2C%22orientation%22%3A%22bottom%22%2C%22series%22%3A%5B%7B%22axisId%22%3A%22let_events.total_estimated_audience_size%22%2C%22id%22%3A%22let_events.total_estimated_audience_size%22%2C%22name%22%3A%22Total+Estimated+Audience+Size%22%7D%5D%2C%22showLabels%22%3Afalse%2C%22showValues%22%3Afalse%2C%22unpinAxis%22%3Afalse%2C%22tickDensity%22%3A%22default%22%2C%22tickDensityCustom%22%3A5%2C%22type%22%3A%22linear%22%7D%5D%2C%22label_value_format%22%3A%220.0%2C%5C%22K%5C%22%22%2C%22series_types%22%3A%7B%7D%2C%22series_labels%22%3A%7B%7D%2C%22custom_color_enabled%22%3Atrue%2C%22show_single_value_title%22%3Atrue%2C%22show_comparison%22%3Afalse%2C%22comparison_type%22%3A%22value%22%2C%22comparison_reverse_colors%22%3Afalse%2C%22show_comparison_label%22%3Atrue%2C%22enable_conditional_formatting%22%3Afalse%2C%22conditional_formatting_include_totals%22%3Afalse%2C%22conditional_formatting_include_nulls%22%3Afalse%2C%22custom_color%22%3A%22%2334A853%22%2C%22single_value_title%22%3A%22Flights%22%2C%22value_format%22%3A%220.0%2C%5C%22K%5C%22%22%2C%22font_size_main%22%3A%22%22%2C%22style_let_events.count%22%3A%22%2334A853%22%2C%22show_title_let_events.count%22%3Atrue%2C%22title_overrride_let_events.count%22%3A%22Upcoming+Events%22%2C%22title_placement_let_events.count%22%3A%22below%22%2C%22value_format_let_events.count%22%3A%220.0%2C%5C%22K%5C%22%22%2C%22style_let_events.total_estimated_audience_size%22%3A%22%2334A853%22%2C%22show_title_let_events.total_estimated_audience_size%22%3Atrue%2C%22title_overrride_let_events.total_estimated_audience_size%22%3A%22Total+Estimated+Audience%22%2C%22title_placement_let_events.total_estimated_audience_size%22%3A%22below%22%2C%22value_format_let_events.total_estimated_audience_size%22%3A%220.0%2C%2C%5C%22M%5C%22%22%2C%22show_comparison_let_events.total_estimated_audience_size%22%3Afalse%2C%22style_flight_facts.count%22%3A%22%2334A853%22%2C%22show_title_flight_facts.count%22%3Atrue%2C%22title_overrride_flight_facts.count%22%3A%22Flights%22%2C%22title_placement_flight_facts.count%22%3A%22below%22%2C%22value_format_flight_facts.count%22%3A%220.0%2C%5C%22K%5C%22%22%2C%22show_comparison_flight_facts.count%22%3Afalse%2C%22hidden_fields%22%3Anull%2C%22hidden_points_if_no%22%3A%5B%5D%2C%22type%22%3A%22looker_bar%22%2C%22defaults_version%22%3A1%7D&filter_config=%7B%22date_table.calendar_date%22%3A%5B%7B%22type%22%3A%22before%22%2C%22values%22%3A%5B%7B%22constant%22%3A%223%22%2C%22unit%22%3A%22mof%22%7D%2C%7B%7D%5D%2C%22id%22%3A4%2C%22variant%22%3A%22relative%22%2C%22error%22%3Afalse%7D%5D%2C%22date_table.is_future_date%22%3A%5B%7B%22type%22%3A%22is%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22Yes%22%7D%2C%7B%7D%5D%2C%22id%22%3A5%2C%22error%22%3Afalse%7D%5D%2C%22let_events.status%22%3A%5B%7B%22type%22%3A%22%3D%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22Active%22%7D%2C%7B%7D%5D%2C%22id%22%3A6%2C%22error%22%3Afalse%7D%5D%7D&origin=share-expanded"
    }
  }


  measure: count_market_areas {
    label: "Count of Designated Market Areas"
    type: count_distinct
    sql: ${dma_name} ;;
    drill_fields: [details*]
  }

  set: details {
    fields: [id, name, status, categories, dma_name, local_event_datetime_time, local_event_end_datetime_time, estimated_audience_size, city, state, country]
  }
}

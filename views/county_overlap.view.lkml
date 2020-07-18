view: county_overlap {
#   sql_table_name: `looker-private-demo.brand_sentiment.county_overlap`
  derived_table: {
    sql: SELECT * FROM `looker-private-demo.brand_sentiment.county_overlap`
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
    sql: concat(${county_geoid},${zip},${calendar_date}) ;;
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

  dimension: county_ansi {
    hidden: yes
    type: number
    sql: ${TABLE}.COUNTY_ANSI ;;
  }

  dimension: county_fips {
    hidden: yes
    type: string
    sql: CAST(${TABLE}.COUNTY_FIPS as string) ;;
  }

  dimension: county_geoid {
    type: string
    sql: CASE WHEN LENGTH(CAST(${TABLE}.COUNTY_GEOID as string))=4 THEN CONCAT('0',CAST(${TABLE}.COUNTY_GEOID as string)) ELSE CAST(${TABLE}.COUNTY_GEOID as string) END;;
    map_layer_name: us_counties_fips
  }

  dimension: county_name {
    type: string
    sql: ${TABLE}.COUNTY_NAME ;;
  }

  dimension: percent_of_county_area_in_zip {
    hidden: yes
    type: number
    sql: ${TABLE}.PERCENT_OF_COUNTY_AREA_IN_ZIP ;;
  }

  dimension: percent_of_county_households_in_zip {
    hidden: yes
    type: number
    sql: ${TABLE}.PERCENT_OF_COUNTY_HOUSEHOLDS_IN_ZIP ;;
  }

  dimension: percent_of_county_land_area_in_zip {
    hidden: yes
    type: number
    sql: ${TABLE}.PERCENT_OF_COUNTY_LAND_AREA_IN_ZIP ;;
  }

  dimension: percent_of_county_population_in_zip {
    hidden: yes
    type: number
    sql: ${TABLE}.PERCENT_OF_COUNTY_POPULATION_IN_ZIP ;;
  }

  dimension: percent_of_zip_area_in_county {
    hidden: yes
    type: number
    sql: ${TABLE}.PERCENT_OF_ZIP_AREA_IN_COUNTY ;;
  }

  dimension: percent_of_zip_households_in_county {
    hidden: yes
    type: number
    sql: ${TABLE}.PERCENT_OF_ZIP_HOUSEHOLDS_IN_COUNTY ;;
  }

  dimension: percent_of_zip_land_area_in_county {
    hidden: yes
    type: number
    sql: ${TABLE}.PERCENT_OF_ZIP_LAND_AREA_IN_COUNTY ;;
  }

  dimension: percent_of_zip_population_in_county {
    hidden: yes
    type: number
    sql: ${TABLE}.PERCENT_OF_ZIP_POPULATION_IN_COUNTY ;;
  }

  dimension: state_abbr {
    hidden: yes
    type: string
    sql: ${TABLE}.STATE_ABBR ;;
  }

  dimension: state_ansi {
    hidden: yes
    type: number
    sql: ${TABLE}.STATE_ANSI ;;
  }

  dimension: state_fips {
  #     hidden: yes
    type: number
    sql: ${TABLE}.STATE_FIPS ;;
  }

  dimension: state_name {
    type: string
    sql: ${TABLE}.STATE_NAME ;;
    map_layer_name: us_states
  }

  dimension: zip {
    type: zipcode
    sql: ${TABLE}.ZIP ;;
    map_layer_name: us_zipcode_tabulation_areas
  }

  measure: count {
    label: "Count of Zip Codes"
    type: count
    drill_fields: [state_name, county_name]
  }

  parameter: hub_state {
  #     hidden: yes
  type: string
  suggest_dimension: state_name
  suggest_explore: date_table
  #     allowed_value: {
  #       label: "California"
  #       value: "California"
  #     }
  #     allowed_value: {
  #       label: "New York"
  #       value: "New York"
  #     }
  #     allowed_value: {
  #       label: "Georgia"
  #       value: "Georgia"
  #     }
  #     allowed_value: {
  #       label: "Massachusetts"
  #       value: "Massachusetts"
  #     }
  }

  measure: state {
    label: "Airport of Hub State"
  #     hidden: yes
    type: string
    sql: {% if hub_state._parameter_value == "'California'" %} 'LAX'
           {% elsif hub_state._parameter_value == "'New York'" %} 'JFK'
           {% elsif hub_state._parameter_value == "'Georgia'" %} 'ATL'
           {% elsif hub_state._parameter_value == "'Massachusetts'" %} 'BOS'
           {% else %} 'ATL'
           {% endif %}
        ;;
    link: {
      label: "View State Mobility"
      url: "{{link}}&fields=mobility_data_core.transit_stations_7_day_moving_avg,mobility_data_core.grocery_and_pharmacy_7_day_moving_avg,mobility_data_core.parks_7_day_moving_avg,mobility_data_core.residential_7_day_moving_avg,mobility_data_core.retail_and_recreation_7_day_moving_avg,date_table.calendar_date,us_counties.total_confirmed_cases,expected_weather_by_state.forecasted_temperature&fill_fields=date_table.calendar_date&f[mobility_data_core.geography_level]=1&f[date_table.calendar_date]=after+2020%2F02%2F15&f[date_table.is_future_date]=No&f[date_table.state_name]={{ hub_state._parameter_value}}&sorts=date_table.calendar_date+desc&limit=500&query_timezone=America%2FLos_Angeles&vis=%7B%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Afalse%2C%22show_view_names%22%3Afalse%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Afalse%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22plot_size_by_field%22%3Afalse%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22limit_displayed_rows%22%3Afalse%2C%22legend_position%22%3A%22center%22%2C%22point_style%22%3A%22none%22%2C%22show_value_labels%22%3Afalse%2C%22label_density%22%3A25%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22show_null_points%22%3Afalse%2C%22interpolation%22%3A%22monotone%22%2C%22color_application%22%3A%7B%22collection_id%22%3A%22google%22%2C%22palette_id%22%3A%22google-categorical-0%22%2C%22options%22%3A%7B%22steps%22%3A5%7D%7D%2C%22y_axes%22%3A%5B%7B%22label%22%3A%22%22%2C%22orientation%22%3A%22left%22%2C%22series%22%3A%5B%7B%22axisId%22%3A%22mobility_data_core.transit_stations_7_day_moving_avg%22%2C%22id%22%3A%22mobility_data_core.transit_stations_7_day_moving_avg%22%2C%22name%22%3A%22Transit+Stations+%287-Day+Moving+Avg%29%22%7D%2C%7B%22axisId%22%3A%22mobility_data_core.grocery_and_pharmacy_7_day_moving_avg%22%2C%22id%22%3A%22mobility_data_core.grocery_and_pharmacy_7_day_moving_avg%22%2C%22name%22%3A%22Grocery+and+Pharmacy+%287-Day+Moving+Avg%29%22%7D%2C%7B%22axisId%22%3A%22mobility_data_core.parks_7_day_moving_avg%22%2C%22id%22%3A%22mobility_data_core.parks_7_day_moving_avg%22%2C%22name%22%3A%22Parks+%287-Day+Moving+Avg%29%22%7D%2C%7B%22axisId%22%3A%22mobility_data_core.residential_7_day_moving_avg%22%2C%22id%22%3A%22mobility_data_core.residential_7_day_moving_avg%22%2C%22name%22%3A%22Residential+%287-Day+Moving+Avg%29%22%7D%2C%7B%22axisId%22%3A%22mobility_data_core.retail_and_recreation_7_day_moving_avg%22%2C%22id%22%3A%22mobility_data_core.retail_and_recreation_7_day_moving_avg%22%2C%22name%22%3A%22Retail+and+Recreation+%287-Day+Moving+Avg%29%22%7D%5D%2C%22showLabels%22%3Atrue%2C%22showValues%22%3Atrue%2C%22valueFormat%22%3A%220%25%22%2C%22unpinAxis%22%3Afalse%2C%22tickDensity%22%3A%22default%22%2C%22tickDensityCustom%22%3A5%2C%22type%22%3A%22linear%22%7D%2C%7B%22label%22%3Anull%2C%22orientation%22%3A%22right%22%2C%22series%22%3A%5B%7B%22axisId%22%3A%22expected_weather_by_state.forecasted_temperature%22%2C%22id%22%3A%22expected_weather_by_state.forecasted_temperature%22%2C%22name%22%3A%22Forecasted+Temperature%22%7D%5D%2C%22showLabels%22%3Atrue%2C%22showValues%22%3Atrue%2C%22valueFormat%22%3A%22%22%2C%22unpinAxis%22%3Afalse%2C%22tickDensity%22%3A%22default%22%2C%22tickDensityCustom%22%3A5%2C%22type%22%3A%22linear%22%7D%2C%7B%22label%22%3A%22%22%2C%22orientation%22%3A%22right%22%2C%22series%22%3A%5B%7B%22axisId%22%3A%22new_cases%22%2C%22id%22%3A%22new_cases%22%2C%22name%22%3A%22New+Cases%22%7D%5D%2C%22showLabels%22%3Afalse%2C%22showValues%22%3Afalse%2C%22unpinAxis%22%3Afalse%2C%22tickDensity%22%3A%22default%22%2C%22type%22%3A%22linear%22%7D%5D%2C%22hidden_series%22%3A%5B%5D%2C%22series_types%22%3A%7B%22expected_weather_by_state.forecasted_temperature%22%3A%22scatter%22%2C%22new_cases%22%3A%22column%22%7D%2C%22series_colors%22%3A%7B%22new_cases%22%3A%22%23E8EAED%22%7D%2C%22series_labels%22%3A%7B%22new_cases%22%3A%22New+Covid-19+Cases%22%7D%2C%22series_point_styles%22%3A%7B%22expected_weather_by_state.forecasted_temperature%22%3A%22diamond%22%7D%2C%22label_color%22%3A%5B%22transparent%22%2C%22transparent%22%2C%22transparent%22%2C%22transparent%22%2C%22transparent%22%2C%22black%22%5D%2C%22reference_lines%22%3A%5B%7B%22reference_type%22%3A%22line%22%2C%22range_start%22%3A%22max%22%2C%22range_end%22%3A%22min%22%2C%22margin_top%22%3A%22deviation%22%2C%22margin_value%22%3A%22mean%22%2C%22margin_bottom%22%3A%22deviation%22%2C%22label_position%22%3A%22center%22%2C%22color%22%3A%22%23000000%22%2C%22line_value%22%3A%220%22%2C%22label%22%3A%22Baseline%22%7D%5D%2C%22type%22%3A%22looker_line%22%2C%22defaults_version%22%3A1%2C%22show_totals_labels%22%3Afalse%2C%22show_silhouette%22%3Afalse%2C%22totals_color%22%3A%22%23808080%22%2C%22hidden_fields%22%3A%5B%22us_counties.total_confirmed_cases%22%5D%7D&filter_config=%7B%22mobility_data_core.geography_level%22%3A%5B%7B%22type%22%3A%22is%22%2C%22values%22%3A%5B%7B%22constant%22%3A%221%22%7D%2C%7B%7D%5D%2C%22id%22%3A9%2C%22error%22%3Afalse%7D%5D%2C%22date_table.calendar_date%22%3A%5B%7B%22type%22%3A%22after%22%2C%22values%22%3A%5B%7B%22date%22%3A%222020-02-15T14%3A25%3A03.388Z%22%2C%22constant%22%3A%227%22%2C%22unit%22%3A%22day%22%2C%22tz%22%3Atrue%7D%5D%2C%22id%22%3A13%2C%22error%22%3Afalse%2C%22variant%22%3A%22absolute%22%7D%5D%2C%22date_table.is_future_date%22%3A%5B%7B%22type%22%3A%22is%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22No%22%7D%2C%7B%7D%5D%2C%22id%22%3A14%2C%22error%22%3Afalse%7D%5D%2C%22date_table.state_name%22%3A%5B%7B%22type%22%3A%22%3D%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22Massachusetts%22%7D%2C%7B%7D%5D%2C%22id%22%3A15%2C%22error%22%3Afalse%7D%5D%7D&dynamic_fields=%5B%7B%22table_calculation%22%3A%22new_cases%22%2C%22label%22%3A%22New+Cases%22%2C%22expression%22%3A%22if%28%24%7Bus_counties.total_confirmed_cases%7D%3D0%2C0%2C%24%7Bus_counties.total_confirmed_cases%7D-offset%28%24%7Bus_counties.total_confirmed_cases%7D%2C1%29%29%22%2C%22value_format%22%3Anull%2C%22value_format_name%22%3Anull%2C%22_kind_hint%22%3A%22measure%22%2C%22_type_hint%22%3A%22number%22%7D%5D&origin=share-expanded"
    }
    link: {
      label: "View Category Breakdown"
      url: "{{link}}&fields=active,let_events.count,let_events.top_tier_catgory&pivots=active&f[date_table.calendar_date]=before+3+months+from+now&f[date_table.is_future_date]=Yes&f[date_table.state_name]={{ hub_state._parameter_value }}&f[let_events.top_tier_catgory]=-NULL%2C-Arts+%26+Theatre%2C-Theater+and+Arts&sorts=let_events.top_tier_catgory+0,active&limit=500&column_limit=50&query_timezone=America%2FLos_Angeles&vis=%7B%22show_value_labels%22%3Atrue%2C%22font_size%22%3A12%2C%22color_application%22%3A%7B%22collection_id%22%3A%22google%22%2C%22palette_id%22%3A%22google-categorical-0%22%2C%22options%22%3A%7B%22steps%22%3A5%2C%22reverse%22%3Afalse%7D%7D%2C%22series_colors%22%3A%7B%22Theatre%28Arts%29+-+let_events.count%22%3A%22%234285F4%22%2C%22Concert+-+let_events.count%22%3A%22%23EA4335%22%2C%22Sports+-+let_events.count%22%3A%22%23FBBC04%22%2C%22Film+-+let_events.count%22%3A%22%235F6368%22%2C%22Theater+and+Arts+-+let_events.count%22%3A%22%234285F4%22%2C%22Miscellaneous+-+let_events.count%22%3A%22%2334A853%22%7D%2C%22series_labels%22%3A%7B%22Miscellaneous+-+let_events.count%22%3A%22Misc.%22%7D%2C%22value_labels%22%3A%22labels%22%2C%22label_type%22%3A%22labPer%22%2C%22inner_radius%22%3A55%2C%22font_size_main%22%3A%22%22%2C%22style_let_events.count%22%3A%22%2334A853%22%2C%22show_title_let_events.count%22%3Atrue%2C%22title_overrride_let_events.count%22%3A%22Upcoming+Events%22%2C%22title_placement_let_events.count%22%3A%22below%22%2C%22value_format_let_events.count%22%3A%220.0%2C%5C%22K%5C%22%22%2C%22style_let_events.total_estimated_audience_size%22%3A%22%2334A853%22%2C%22show_title_let_events.total_estimated_audience_size%22%3Atrue%2C%22title_overrride_let_events.total_estimated_audience_size%22%3A%22Total+Estimated+Audience%22%2C%22title_placement_let_events.total_estimated_audience_size%22%3A%22below%22%2C%22value_format_let_events.total_estimated_audience_size%22%3A%220.0%2C%2C%5C%22M%5C%22%22%2C%22show_comparison_let_events.total_estimated_audience_size%22%3Afalse%2C%22style_flight_facts.count%22%3A%22%2334A853%22%2C%22show_title_flight_facts.count%22%3Atrue%2C%22title_overrride_flight_facts.count%22%3A%22Flights%22%2C%22title_placement_flight_facts.count%22%3A%22below%22%2C%22value_format_flight_facts.count%22%3A%220.0%2C%5C%22K%5C%22%22%2C%22show_comparison_flight_facts.count%22%3Afalse%2C%22type%22%3A%22looker_donut_multiples%22%2C%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Atrue%2C%22show_view_names%22%3Afalse%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Atrue%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22plot_size_by_field%22%3Afalse%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22limit_displayed_rows%22%3Afalse%2C%22legend_position%22%3A%22center%22%2C%22point_style%22%3A%22none%22%2C%22label_density%22%3A25%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22ordering%22%3A%22none%22%2C%22show_null_labels%22%3Afalse%2C%22show_totals_labels%22%3Afalse%2C%22show_silhouette%22%3Afalse%2C%22totals_color%22%3A%22%23808080%22%2C%22defaults_version%22%3A1%2C%22series_types%22%3A%7B%7D%2C%22hidden_fields%22%3A%5B%5D%2C%22hidden_points_if_no%22%3A%5B%5D%2C%22custom_color_enabled%22%3Atrue%2C%22show_single_value_title%22%3Atrue%2C%22show_comparison%22%3Afalse%2C%22comparison_type%22%3A%22value%22%2C%22comparison_reverse_colors%22%3Afalse%2C%22show_comparison_label%22%3Atrue%2C%22enable_conditional_formatting%22%3Afalse%2C%22conditional_formatting_include_totals%22%3Afalse%2C%22conditional_formatting_include_nulls%22%3Afalse%7D&filter_config=%7B%22date_table.calendar_date%22%3A%5B%7B%22type%22%3A%22before%22%2C%22values%22%3A%5B%7B%22date%22%3A%222020-06-12T12%3A53%3A12.782Z%22%2C%22constant%22%3A%223%22%2C%22unit%22%3A%22mof%22%2C%22tz%22%3Atrue%7D%5D%2C%22id%22%3A0%2C%22error%22%3Afalse%2C%22variant%22%3A%22relative%22%7D%5D%2C%22date_table.is_future_date%22%3A%5B%7B%22type%22%3A%22is%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22Yes%22%7D%2C%7B%7D%5D%2C%22id%22%3A1%2C%22error%22%3Afalse%7D%5D%2C%22date_table.hub_state%22%3A%5B%7B%22type%22%3A%22is%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22California%22%7D%2C%7B%7D%5D%2C%22id%22%3A0%2C%22error%22%3Afalse%7D%5D%2C%22date_table.state_name%22%3A%5B%7B%22type%22%3A%22%3D%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22California%22%7D%2C%7B%7D%5D%2C%22id%22%3A1%2C%22error%22%3Afalse%7D%5D%2C%22let_events.top_tier_catgory%22%3A%5B%7B%22type%22%3A%22%21null%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22%22%7D%2C%7B%7D%5D%2C%22id%22%3A3%2C%22error%22%3Afalse%7D%2C%7B%22type%22%3A%22%21%3D%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22Arts+%5Cu0026+Theatre%22%7D%2C%7B%7D%5D%2C%22id%22%3A4%2C%22error%22%3Afalse%7D%2C%7B%22type%22%3A%22%21%3D%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22Theater+and+Arts%22%7D%2C%7B%7D%5D%2C%22id%22%3A5%2C%22error%22%3Afalse%7D%5D%7D&dynamic_fields=%5B%7B%22dimension%22%3A%22active%22%2C%22label%22%3A%22Active%22%2C%22expression%22%3A%22if%28%24%7Blet_events.is_active%7D%2C%5C%22Active%5C%22%2C%5C%22Cancelled%5C%22%29%22%2C%22value_format%22%3Anull%2C%22value_format_name%22%3Anull%2C%22_kind_hint%22%3A%22dimension%22%2C%22_type_hint%22%3A%22string%22%7D%5D&origin=share-expanded"
    }
    link: {
      label: "Top Designated Market Areas"
      url: "{{link}}&fields=let_events.dma_name,let_events.count&f[date_table.calendar_date]=before+3+months+from+now&f[date_table.is_future_date]=Yes&f[date_table.state_name]={{ hub_state._parameter_value }}&f[let_events.dma_name]=-NULL&f[let_events.status]=Active&sorts=let_events.count+desc&limit=500&column_limit=50&vis=%7B%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Afalse%2C%22show_view_names%22%3Afalse%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Afalse%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22plot_size_by_field%22%3Afalse%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22normal%22%2C%22limit_displayed_rows%22%3Afalse%2C%22legend_position%22%3A%22center%22%2C%22point_style%22%3A%22none%22%2C%22show_value_labels%22%3Atrue%2C%22label_density%22%3A25%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22ordering%22%3A%22none%22%2C%22show_null_labels%22%3Afalse%2C%22show_totals_labels%22%3Afalse%2C%22show_silhouette%22%3Afalse%2C%22totals_color%22%3A%22%23808080%22%2C%22color_application%22%3A%7B%22collection_id%22%3A%22google%22%2C%22palette_id%22%3A%22google-categorical-0%22%2C%22options%22%3A%7B%22steps%22%3A5%7D%7D%2C%22y_axes%22%3A%5B%7B%22label%22%3A%22%22%2C%22orientation%22%3A%22bottom%22%2C%22series%22%3A%5B%7B%22axisId%22%3A%22let_events.count%22%2C%22id%22%3A%22let_events.count%22%2C%22name%22%3A%22Count+of+Events%22%7D%5D%2C%22showLabels%22%3Afalse%2C%22showValues%22%3Afalse%2C%22unpinAxis%22%3Afalse%2C%22tickDensity%22%3A%22default%22%2C%22tickDensityCustom%22%3A5%2C%22type%22%3A%22linear%22%7D%5D%2C%22series_types%22%3A%7B%22let_events.total_estimated_audience_size%22%3A%22line%22%7D%2C%22series_colors%22%3A%7B%22let_events.count%22%3A%22%23FBBC04%22%7D%2C%22type%22%3A%22looker_bar%22%2C%22defaults_version%22%3A1%2C%22hidden_fields%22%3Anull%7D&filter_config=%7B%22date_table.calendar_date%22%3A%5B%7B%22type%22%3A%22before%22%2C%22values%22%3A%5B%7B%22date%22%3A%222020-06-12T13%3A39%3A01.647Z%22%2C%22constant%22%3A%223%22%2C%22unit%22%3A%22mof%22%2C%22tz%22%3Atrue%7D%5D%2C%22id%22%3A1%2C%22error%22%3Afalse%2C%22variant%22%3A%22relative%22%7D%5D%2C%22date_table.is_future_date%22%3A%5B%7B%22type%22%3A%22is%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22Yes%22%7D%2C%7B%7D%5D%2C%22id%22%3A2%7D%5D%2C%22county_overlap.state_name%22%3A%5B%7B%22type%22%3A%22%3D%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22California%22%7D%2C%7B%7D%5D%2C%22id%22%3A3%2C%22error%22%3Afalse%7D%5D%2C%22let_events.dma_name%22%3A%5B%7B%22type%22%3A%22%21null%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22%22%7D%2C%7B%7D%5D%2C%22id%22%3A4%2C%22error%22%3Afalse%7D%5D%2C%22let_events.status%22%3A%5B%7B%22type%22%3A%22%3D%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22Active%22%7D%2C%7B%7D%5D%2C%22id%22%3A5%2C%22error%22%3Afalse%7D%5D%7D&dynamic_fields=%5B%5D&origin=share-expanded"
    }
    link: {
      label: "View Top Events"
      url: "{{link}}&fields=let_events.total_estimated_audience_size,let_events.name&f[date_table.calendar_date]=before+3+months+from+now&f[date_table.is_future_date]=Yes&f[let_events.status]=Active&f[date_table.state_name]={{ hub_state._parameter_value }}&sorts=let_events.total_estimated_audience_size+desc&limit=5&column_limit=50&vis=%7B%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Afalse%2C%22show_view_names%22%3Afalse%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Afalse%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22plot_size_by_field%22%3Afalse%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22limit_displayed_rows%22%3Afalse%2C%22legend_position%22%3A%22center%22%2C%22point_style%22%3A%22none%22%2C%22show_value_labels%22%3Atrue%2C%22label_density%22%3A25%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22ordering%22%3A%22none%22%2C%22show_null_labels%22%3Afalse%2C%22show_totals_labels%22%3Afalse%2C%22show_silhouette%22%3Afalse%2C%22totals_color%22%3A%22%23808080%22%2C%22color_application%22%3A%7B%22collection_id%22%3A%22google%22%2C%22palette_id%22%3A%22google-categorical-0%22%7D%2C%22y_axes%22%3A%5B%7B%22label%22%3A%22%22%2C%22orientation%22%3A%22bottom%22%2C%22series%22%3A%5B%7B%22axisId%22%3A%22let_events.total_estimated_audience_size%22%2C%22id%22%3A%22let_events.total_estimated_audience_size%22%2C%22name%22%3A%22Total+Estimated+Audience+Size%22%7D%5D%2C%22showLabels%22%3Afalse%2C%22showValues%22%3Afalse%2C%22unpinAxis%22%3Afalse%2C%22tickDensity%22%3A%22default%22%2C%22tickDensityCustom%22%3A5%2C%22type%22%3A%22linear%22%7D%5D%2C%22label_value_format%22%3A%220.0%2C%5C%22K%5C%22%22%2C%22series_types%22%3A%7B%7D%2C%22series_labels%22%3A%7B%7D%2C%22custom_color_enabled%22%3Atrue%2C%22show_single_value_title%22%3Atrue%2C%22show_comparison%22%3Afalse%2C%22comparison_type%22%3A%22value%22%2C%22comparison_reverse_colors%22%3Afalse%2C%22show_comparison_label%22%3Atrue%2C%22enable_conditional_formatting%22%3Afalse%2C%22conditional_formatting_include_totals%22%3Afalse%2C%22conditional_formatting_include_nulls%22%3Afalse%2C%22custom_color%22%3A%22%2334A853%22%2C%22single_value_title%22%3A%22Flights%22%2C%22value_format%22%3A%220.0%2C%5C%22K%5C%22%22%2C%22font_size_main%22%3A%22%22%2C%22style_let_events.count%22%3A%22%2334A853%22%2C%22show_title_let_events.count%22%3Atrue%2C%22title_overrride_let_events.count%22%3A%22Upcoming+Events%22%2C%22title_placement_let_events.count%22%3A%22below%22%2C%22value_format_let_events.count%22%3A%220.0%2C%5C%22K%5C%22%22%2C%22style_let_events.total_estimated_audience_size%22%3A%22%2334A853%22%2C%22show_title_let_events.total_estimated_audience_size%22%3Atrue%2C%22title_overrride_let_events.total_estimated_audience_size%22%3A%22Total+Estimated+Audience%22%2C%22title_placement_let_events.total_estimated_audience_size%22%3A%22below%22%2C%22value_format_let_events.total_estimated_audience_size%22%3A%220.0%2C%2C%5C%22M%5C%22%22%2C%22show_comparison_let_events.total_estimated_audience_size%22%3Afalse%2C%22style_flight_facts.count%22%3A%22%2334A853%22%2C%22show_title_flight_facts.count%22%3Atrue%2C%22title_overrride_flight_facts.count%22%3A%22Flights%22%2C%22title_placement_flight_facts.count%22%3A%22below%22%2C%22value_format_flight_facts.count%22%3A%220.0%2C%5C%22K%5C%22%22%2C%22show_comparison_flight_facts.count%22%3Afalse%2C%22hidden_fields%22%3Anull%2C%22hidden_points_if_no%22%3A%5B%5D%2C%22type%22%3A%22looker_bar%22%2C%22defaults_version%22%3A1%7D&filter_config=%7B%22date_table.calendar_date%22%3A%5B%7B%22type%22%3A%22before%22%2C%22values%22%3A%5B%7B%22constant%22%3A%223%22%2C%22unit%22%3A%22mof%22%7D%2C%7B%7D%5D%2C%22id%22%3A4%2C%22variant%22%3A%22relative%22%2C%22error%22%3Afalse%7D%5D%2C%22date_table.is_future_date%22%3A%5B%7B%22type%22%3A%22is%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22Yes%22%7D%2C%7B%7D%5D%2C%22id%22%3A5%2C%22error%22%3Afalse%7D%5D%2C%22let_events.status%22%3A%5B%7B%22type%22%3A%22%3D%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22Active%22%7D%2C%7B%7D%5D%2C%22id%22%3A6%2C%22error%22%3Afalse%7D%5D%7D&origin=share-expanded"
    }
    drill_fields: [county_geoid,let_events.count]
    html:
      <div style="background-color: #f6f8fa; height:500px;width:100%"></div>
      <div style="background-color: #f6f8fa; height:100%; width:100%; display:inline-block;"><center><font size="4"><strong>{{linked_value}} </strong></font><a style="display:inline-block;"><img src="https://i.ya-webdesign.com/images/three-dots-png-6.png" width="12px"></a></center></div>
      <div style="background-color: #f6f8fa; height:500px;width:100%"></div>;;
  }
  #F6F6F7

  measure: hub_state_selection {
    label: "Hub State"
    description: "Use with Hub State filter."
  #     hidden: yes
    type: string
    sql: {{ hub_state._parameter_value }}
      ;;
    link: {
      label: "View State Mobility"
      url: "{{link}}&fields=mobility_data_core.transit_stations_7_day_moving_avg,mobility_data_core.grocery_and_pharmacy_7_day_moving_avg,mobility_data_core.parks_7_day_moving_avg,mobility_data_core.residential_7_day_moving_avg,mobility_data_core.retail_and_recreation_7_day_moving_avg,date_table.calendar_date,us_counties.total_confirmed_cases,expected_weather_by_state.forecasted_temperature&fill_fields=date_table.calendar_date&f[mobility_data_core.geography_level]=1&f[date_table.calendar_date]=after+2020%2F02%2F15&f[date_table.is_future_date]=No&f[date_table.state_name]={{ hub_state._parameter_value}}&sorts=date_table.calendar_date+desc&limit=500&query_timezone=America%2FLos_Angeles&vis=%7B%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Afalse%2C%22show_view_names%22%3Afalse%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Afalse%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22plot_size_by_field%22%3Afalse%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22limit_displayed_rows%22%3Afalse%2C%22legend_position%22%3A%22center%22%2C%22point_style%22%3A%22none%22%2C%22show_value_labels%22%3Afalse%2C%22label_density%22%3A25%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22show_null_points%22%3Afalse%2C%22interpolation%22%3A%22monotone%22%2C%22color_application%22%3A%7B%22collection_id%22%3A%22google%22%2C%22palette_id%22%3A%22google-categorical-0%22%2C%22options%22%3A%7B%22steps%22%3A5%7D%7D%2C%22y_axes%22%3A%5B%7B%22label%22%3A%22%22%2C%22orientation%22%3A%22left%22%2C%22series%22%3A%5B%7B%22axisId%22%3A%22mobility_data_core.transit_stations_7_day_moving_avg%22%2C%22id%22%3A%22mobility_data_core.transit_stations_7_day_moving_avg%22%2C%22name%22%3A%22Transit+Stations+%287-Day+Moving+Avg%29%22%7D%2C%7B%22axisId%22%3A%22mobility_data_core.grocery_and_pharmacy_7_day_moving_avg%22%2C%22id%22%3A%22mobility_data_core.grocery_and_pharmacy_7_day_moving_avg%22%2C%22name%22%3A%22Grocery+and+Pharmacy+%287-Day+Moving+Avg%29%22%7D%2C%7B%22axisId%22%3A%22mobility_data_core.parks_7_day_moving_avg%22%2C%22id%22%3A%22mobility_data_core.parks_7_day_moving_avg%22%2C%22name%22%3A%22Parks+%287-Day+Moving+Avg%29%22%7D%2C%7B%22axisId%22%3A%22mobility_data_core.residential_7_day_moving_avg%22%2C%22id%22%3A%22mobility_data_core.residential_7_day_moving_avg%22%2C%22name%22%3A%22Residential+%287-Day+Moving+Avg%29%22%7D%2C%7B%22axisId%22%3A%22mobility_data_core.retail_and_recreation_7_day_moving_avg%22%2C%22id%22%3A%22mobility_data_core.retail_and_recreation_7_day_moving_avg%22%2C%22name%22%3A%22Retail+and+Recreation+%287-Day+Moving+Avg%29%22%7D%5D%2C%22showLabels%22%3Atrue%2C%22showValues%22%3Atrue%2C%22valueFormat%22%3A%220%25%22%2C%22unpinAxis%22%3Afalse%2C%22tickDensity%22%3A%22default%22%2C%22tickDensityCustom%22%3A5%2C%22type%22%3A%22linear%22%7D%2C%7B%22label%22%3Anull%2C%22orientation%22%3A%22right%22%2C%22series%22%3A%5B%7B%22axisId%22%3A%22expected_weather_by_state.forecasted_temperature%22%2C%22id%22%3A%22expected_weather_by_state.forecasted_temperature%22%2C%22name%22%3A%22Forecasted+Temperature%22%7D%5D%2C%22showLabels%22%3Atrue%2C%22showValues%22%3Atrue%2C%22valueFormat%22%3A%22%22%2C%22unpinAxis%22%3Afalse%2C%22tickDensity%22%3A%22default%22%2C%22tickDensityCustom%22%3A5%2C%22type%22%3A%22linear%22%7D%2C%7B%22label%22%3A%22%22%2C%22orientation%22%3A%22right%22%2C%22series%22%3A%5B%7B%22axisId%22%3A%22new_cases%22%2C%22id%22%3A%22new_cases%22%2C%22name%22%3A%22New+Cases%22%7D%5D%2C%22showLabels%22%3Afalse%2C%22showValues%22%3Afalse%2C%22unpinAxis%22%3Afalse%2C%22tickDensity%22%3A%22default%22%2C%22type%22%3A%22linear%22%7D%5D%2C%22hidden_series%22%3A%5B%5D%2C%22series_types%22%3A%7B%22expected_weather_by_state.forecasted_temperature%22%3A%22scatter%22%2C%22new_cases%22%3A%22column%22%7D%2C%22series_colors%22%3A%7B%22new_cases%22%3A%22%23E8EAED%22%7D%2C%22series_labels%22%3A%7B%22new_cases%22%3A%22New+Covid-19+Cases%22%7D%2C%22series_point_styles%22%3A%7B%22expected_weather_by_state.forecasted_temperature%22%3A%22diamond%22%7D%2C%22label_color%22%3A%5B%22transparent%22%2C%22transparent%22%2C%22transparent%22%2C%22transparent%22%2C%22transparent%22%2C%22black%22%5D%2C%22reference_lines%22%3A%5B%7B%22reference_type%22%3A%22line%22%2C%22range_start%22%3A%22max%22%2C%22range_end%22%3A%22min%22%2C%22margin_top%22%3A%22deviation%22%2C%22margin_value%22%3A%22mean%22%2C%22margin_bottom%22%3A%22deviation%22%2C%22label_position%22%3A%22center%22%2C%22color%22%3A%22%23000000%22%2C%22line_value%22%3A%220%22%2C%22label%22%3A%22Baseline%22%7D%5D%2C%22type%22%3A%22looker_line%22%2C%22defaults_version%22%3A1%2C%22show_totals_labels%22%3Afalse%2C%22show_silhouette%22%3Afalse%2C%22totals_color%22%3A%22%23808080%22%2C%22hidden_fields%22%3A%5B%22us_counties.total_confirmed_cases%22%5D%7D&filter_config=%7B%22mobility_data_core.geography_level%22%3A%5B%7B%22type%22%3A%22is%22%2C%22values%22%3A%5B%7B%22constant%22%3A%221%22%7D%2C%7B%7D%5D%2C%22id%22%3A9%2C%22error%22%3Afalse%7D%5D%2C%22date_table.calendar_date%22%3A%5B%7B%22type%22%3A%22after%22%2C%22values%22%3A%5B%7B%22date%22%3A%222020-02-15T14%3A25%3A03.388Z%22%2C%22constant%22%3A%227%22%2C%22unit%22%3A%22day%22%2C%22tz%22%3Atrue%7D%5D%2C%22id%22%3A13%2C%22error%22%3Afalse%2C%22variant%22%3A%22absolute%22%7D%5D%2C%22date_table.is_future_date%22%3A%5B%7B%22type%22%3A%22is%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22No%22%7D%2C%7B%7D%5D%2C%22id%22%3A14%2C%22error%22%3Afalse%7D%5D%2C%22date_table.state_name%22%3A%5B%7B%22type%22%3A%22%3D%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22Massachusetts%22%7D%2C%7B%7D%5D%2C%22id%22%3A15%2C%22error%22%3Afalse%7D%5D%7D&dynamic_fields=%5B%7B%22table_calculation%22%3A%22new_cases%22%2C%22label%22%3A%22New+Cases%22%2C%22expression%22%3A%22if%28%24%7Bus_counties.total_confirmed_cases%7D%3D0%2C0%2C%24%7Bus_counties.total_confirmed_cases%7D-offset%28%24%7Bus_counties.total_confirmed_cases%7D%2C1%29%29%22%2C%22value_format%22%3Anull%2C%22value_format_name%22%3Anull%2C%22_kind_hint%22%3A%22measure%22%2C%22_type_hint%22%3A%22number%22%7D%5D&origin=share-expanded"
    }
    link: {
      label: "View Category Breakdown"
      url: "{{link}}&fields=active,let_events.count,let_events.top_tier_catgory&pivots=active&f[date_table.calendar_date]=before+3+months+from+now&f[date_table.is_future_date]=Yes&f[date_table.state_name]={{ hub_state._parameter_value }}&f[let_events.top_tier_catgory]=-NULL%2C-Arts+%26+Theatre%2C-Theater+and+Arts&sorts=let_events.top_tier_catgory+0,active&limit=500&column_limit=50&query_timezone=America%2FLos_Angeles&vis=%7B%22show_value_labels%22%3Atrue%2C%22font_size%22%3A12%2C%22color_application%22%3A%7B%22collection_id%22%3A%22google%22%2C%22palette_id%22%3A%22google-categorical-0%22%2C%22options%22%3A%7B%22steps%22%3A5%2C%22reverse%22%3Afalse%7D%7D%2C%22series_colors%22%3A%7B%22Theatre%28Arts%29+-+let_events.count%22%3A%22%234285F4%22%2C%22Concert+-+let_events.count%22%3A%22%23EA4335%22%2C%22Sports+-+let_events.count%22%3A%22%23FBBC04%22%2C%22Film+-+let_events.count%22%3A%22%235F6368%22%2C%22Theater+and+Arts+-+let_events.count%22%3A%22%234285F4%22%2C%22Miscellaneous+-+let_events.count%22%3A%22%2334A853%22%7D%2C%22series_labels%22%3A%7B%22Miscellaneous+-+let_events.count%22%3A%22Misc.%22%7D%2C%22value_labels%22%3A%22labels%22%2C%22label_type%22%3A%22labPer%22%2C%22inner_radius%22%3A55%2C%22font_size_main%22%3A%22%22%2C%22style_let_events.count%22%3A%22%2334A853%22%2C%22show_title_let_events.count%22%3Atrue%2C%22title_overrride_let_events.count%22%3A%22Upcoming+Events%22%2C%22title_placement_let_events.count%22%3A%22below%22%2C%22value_format_let_events.count%22%3A%220.0%2C%5C%22K%5C%22%22%2C%22style_let_events.total_estimated_audience_size%22%3A%22%2334A853%22%2C%22show_title_let_events.total_estimated_audience_size%22%3Atrue%2C%22title_overrride_let_events.total_estimated_audience_size%22%3A%22Total+Estimated+Audience%22%2C%22title_placement_let_events.total_estimated_audience_size%22%3A%22below%22%2C%22value_format_let_events.total_estimated_audience_size%22%3A%220.0%2C%2C%5C%22M%5C%22%22%2C%22show_comparison_let_events.total_estimated_audience_size%22%3Afalse%2C%22style_flight_facts.count%22%3A%22%2334A853%22%2C%22show_title_flight_facts.count%22%3Atrue%2C%22title_overrride_flight_facts.count%22%3A%22Flights%22%2C%22title_placement_flight_facts.count%22%3A%22below%22%2C%22value_format_flight_facts.count%22%3A%220.0%2C%5C%22K%5C%22%22%2C%22show_comparison_flight_facts.count%22%3Afalse%2C%22type%22%3A%22looker_donut_multiples%22%2C%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Atrue%2C%22show_view_names%22%3Afalse%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Atrue%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22plot_size_by_field%22%3Afalse%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22limit_displayed_rows%22%3Afalse%2C%22legend_position%22%3A%22center%22%2C%22point_style%22%3A%22none%22%2C%22label_density%22%3A25%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22ordering%22%3A%22none%22%2C%22show_null_labels%22%3Afalse%2C%22show_totals_labels%22%3Afalse%2C%22show_silhouette%22%3Afalse%2C%22totals_color%22%3A%22%23808080%22%2C%22defaults_version%22%3A1%2C%22series_types%22%3A%7B%7D%2C%22hidden_fields%22%3A%5B%5D%2C%22hidden_points_if_no%22%3A%5B%5D%2C%22custom_color_enabled%22%3Atrue%2C%22show_single_value_title%22%3Atrue%2C%22show_comparison%22%3Afalse%2C%22comparison_type%22%3A%22value%22%2C%22comparison_reverse_colors%22%3Afalse%2C%22show_comparison_label%22%3Atrue%2C%22enable_conditional_formatting%22%3Afalse%2C%22conditional_formatting_include_totals%22%3Afalse%2C%22conditional_formatting_include_nulls%22%3Afalse%7D&filter_config=%7B%22date_table.calendar_date%22%3A%5B%7B%22type%22%3A%22before%22%2C%22values%22%3A%5B%7B%22date%22%3A%222020-06-12T12%3A53%3A12.782Z%22%2C%22constant%22%3A%223%22%2C%22unit%22%3A%22mof%22%2C%22tz%22%3Atrue%7D%5D%2C%22id%22%3A0%2C%22error%22%3Afalse%2C%22variant%22%3A%22relative%22%7D%5D%2C%22date_table.is_future_date%22%3A%5B%7B%22type%22%3A%22is%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22Yes%22%7D%2C%7B%7D%5D%2C%22id%22%3A1%2C%22error%22%3Afalse%7D%5D%2C%22date_table.hub_state%22%3A%5B%7B%22type%22%3A%22is%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22California%22%7D%2C%7B%7D%5D%2C%22id%22%3A0%2C%22error%22%3Afalse%7D%5D%2C%22date_table.state_name%22%3A%5B%7B%22type%22%3A%22%3D%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22California%22%7D%2C%7B%7D%5D%2C%22id%22%3A1%2C%22error%22%3Afalse%7D%5D%2C%22let_events.top_tier_catgory%22%3A%5B%7B%22type%22%3A%22%21null%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22%22%7D%2C%7B%7D%5D%2C%22id%22%3A3%2C%22error%22%3Afalse%7D%2C%7B%22type%22%3A%22%21%3D%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22Arts+%5Cu0026+Theatre%22%7D%2C%7B%7D%5D%2C%22id%22%3A4%2C%22error%22%3Afalse%7D%2C%7B%22type%22%3A%22%21%3D%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22Theater+and+Arts%22%7D%2C%7B%7D%5D%2C%22id%22%3A5%2C%22error%22%3Afalse%7D%5D%7D&dynamic_fields=%5B%7B%22dimension%22%3A%22active%22%2C%22label%22%3A%22Active%22%2C%22expression%22%3A%22if%28%24%7Blet_events.is_active%7D%2C%5C%22Active%5C%22%2C%5C%22Cancelled%5C%22%29%22%2C%22value_format%22%3Anull%2C%22value_format_name%22%3Anull%2C%22_kind_hint%22%3A%22dimension%22%2C%22_type_hint%22%3A%22string%22%7D%5D&origin=share-expanded"
    }
    link: {
      label: "Top Designated Market Areas"
      url: "{{link}}&fields=let_events.dma_name,let_events.count&f[date_table.calendar_date]=before+3+months+from+now&f[date_table.is_future_date]=Yes&f[date_table.state_name]={{ hub_state._parameter_value }}&f[let_events.dma_name]=-NULL&f[let_events.status]=Active&sorts=let_events.count+desc&limit=500&column_limit=50&vis=%7B%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Afalse%2C%22show_view_names%22%3Afalse%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Afalse%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22plot_size_by_field%22%3Afalse%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22normal%22%2C%22limit_displayed_rows%22%3Afalse%2C%22legend_position%22%3A%22center%22%2C%22point_style%22%3A%22none%22%2C%22show_value_labels%22%3Atrue%2C%22label_density%22%3A25%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22ordering%22%3A%22none%22%2C%22show_null_labels%22%3Afalse%2C%22show_totals_labels%22%3Afalse%2C%22show_silhouette%22%3Afalse%2C%22totals_color%22%3A%22%23808080%22%2C%22color_application%22%3A%7B%22collection_id%22%3A%22google%22%2C%22palette_id%22%3A%22google-categorical-0%22%2C%22options%22%3A%7B%22steps%22%3A5%7D%7D%2C%22y_axes%22%3A%5B%7B%22label%22%3A%22%22%2C%22orientation%22%3A%22bottom%22%2C%22series%22%3A%5B%7B%22axisId%22%3A%22let_events.count%22%2C%22id%22%3A%22let_events.count%22%2C%22name%22%3A%22Count+of+Events%22%7D%5D%2C%22showLabels%22%3Afalse%2C%22showValues%22%3Afalse%2C%22unpinAxis%22%3Afalse%2C%22tickDensity%22%3A%22default%22%2C%22tickDensityCustom%22%3A5%2C%22type%22%3A%22linear%22%7D%5D%2C%22series_types%22%3A%7B%22let_events.total_estimated_audience_size%22%3A%22line%22%7D%2C%22series_colors%22%3A%7B%22let_events.count%22%3A%22%23FBBC04%22%7D%2C%22type%22%3A%22looker_bar%22%2C%22defaults_version%22%3A1%2C%22hidden_fields%22%3Anull%7D&filter_config=%7B%22date_table.calendar_date%22%3A%5B%7B%22type%22%3A%22before%22%2C%22values%22%3A%5B%7B%22date%22%3A%222020-06-12T13%3A39%3A01.647Z%22%2C%22constant%22%3A%223%22%2C%22unit%22%3A%22mof%22%2C%22tz%22%3Atrue%7D%5D%2C%22id%22%3A1%2C%22error%22%3Afalse%2C%22variant%22%3A%22relative%22%7D%5D%2C%22date_table.is_future_date%22%3A%5B%7B%22type%22%3A%22is%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22Yes%22%7D%2C%7B%7D%5D%2C%22id%22%3A2%7D%5D%2C%22county_overlap.state_name%22%3A%5B%7B%22type%22%3A%22%3D%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22California%22%7D%2C%7B%7D%5D%2C%22id%22%3A3%2C%22error%22%3Afalse%7D%5D%2C%22let_events.dma_name%22%3A%5B%7B%22type%22%3A%22%21null%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22%22%7D%2C%7B%7D%5D%2C%22id%22%3A4%2C%22error%22%3Afalse%7D%5D%2C%22let_events.status%22%3A%5B%7B%22type%22%3A%22%3D%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22Active%22%7D%2C%7B%7D%5D%2C%22id%22%3A5%2C%22error%22%3Afalse%7D%5D%7D&dynamic_fields=%5B%5D&origin=share-expanded"
    }
    link: {
      label: "View Top Events"
      url: "{{link}}&fields=let_events.total_estimated_audience_size,let_events.name&f[date_table.calendar_date]=before+3+months+from+now&f[date_table.is_future_date]=Yes&f[let_events.status]=Active&f[date_table.state_name]={{ hub_state._parameter_value }}&sorts=let_events.total_estimated_audience_size+desc&limit=5&column_limit=50&vis=%7B%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Afalse%2C%22show_view_names%22%3Afalse%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Afalse%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22plot_size_by_field%22%3Afalse%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22limit_displayed_rows%22%3Afalse%2C%22legend_position%22%3A%22center%22%2C%22point_style%22%3A%22none%22%2C%22show_value_labels%22%3Atrue%2C%22label_density%22%3A25%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22ordering%22%3A%22none%22%2C%22show_null_labels%22%3Afalse%2C%22show_totals_labels%22%3Afalse%2C%22show_silhouette%22%3Afalse%2C%22totals_color%22%3A%22%23808080%22%2C%22color_application%22%3A%7B%22collection_id%22%3A%22google%22%2C%22palette_id%22%3A%22google-categorical-0%22%7D%2C%22y_axes%22%3A%5B%7B%22label%22%3A%22%22%2C%22orientation%22%3A%22bottom%22%2C%22series%22%3A%5B%7B%22axisId%22%3A%22let_events.total_estimated_audience_size%22%2C%22id%22%3A%22let_events.total_estimated_audience_size%22%2C%22name%22%3A%22Total+Estimated+Audience+Size%22%7D%5D%2C%22showLabels%22%3Afalse%2C%22showValues%22%3Afalse%2C%22unpinAxis%22%3Afalse%2C%22tickDensity%22%3A%22default%22%2C%22tickDensityCustom%22%3A5%2C%22type%22%3A%22linear%22%7D%5D%2C%22label_value_format%22%3A%220.0%2C%5C%22K%5C%22%22%2C%22series_types%22%3A%7B%7D%2C%22series_labels%22%3A%7B%7D%2C%22custom_color_enabled%22%3Atrue%2C%22show_single_value_title%22%3Atrue%2C%22show_comparison%22%3Afalse%2C%22comparison_type%22%3A%22value%22%2C%22comparison_reverse_colors%22%3Afalse%2C%22show_comparison_label%22%3Atrue%2C%22enable_conditional_formatting%22%3Afalse%2C%22conditional_formatting_include_totals%22%3Afalse%2C%22conditional_formatting_include_nulls%22%3Afalse%2C%22custom_color%22%3A%22%2334A853%22%2C%22single_value_title%22%3A%22Flights%22%2C%22value_format%22%3A%220.0%2C%5C%22K%5C%22%22%2C%22font_size_main%22%3A%22%22%2C%22style_let_events.count%22%3A%22%2334A853%22%2C%22show_title_let_events.count%22%3Atrue%2C%22title_overrride_let_events.count%22%3A%22Upcoming+Events%22%2C%22title_placement_let_events.count%22%3A%22below%22%2C%22value_format_let_events.count%22%3A%220.0%2C%5C%22K%5C%22%22%2C%22style_let_events.total_estimated_audience_size%22%3A%22%2334A853%22%2C%22show_title_let_events.total_estimated_audience_size%22%3Atrue%2C%22title_overrride_let_events.total_estimated_audience_size%22%3A%22Total+Estimated+Audience%22%2C%22title_placement_let_events.total_estimated_audience_size%22%3A%22below%22%2C%22value_format_let_events.total_estimated_audience_size%22%3A%220.0%2C%2C%5C%22M%5C%22%22%2C%22show_comparison_let_events.total_estimated_audience_size%22%3Afalse%2C%22style_flight_facts.count%22%3A%22%2334A853%22%2C%22show_title_flight_facts.count%22%3Atrue%2C%22title_overrride_flight_facts.count%22%3A%22Flights%22%2C%22title_placement_flight_facts.count%22%3A%22below%22%2C%22value_format_flight_facts.count%22%3A%220.0%2C%5C%22K%5C%22%22%2C%22show_comparison_flight_facts.count%22%3Afalse%2C%22hidden_fields%22%3Anull%2C%22hidden_points_if_no%22%3A%5B%5D%2C%22type%22%3A%22looker_bar%22%2C%22defaults_version%22%3A1%7D&filter_config=%7B%22date_table.calendar_date%22%3A%5B%7B%22type%22%3A%22before%22%2C%22values%22%3A%5B%7B%22constant%22%3A%223%22%2C%22unit%22%3A%22mof%22%7D%2C%7B%7D%5D%2C%22id%22%3A4%2C%22variant%22%3A%22relative%22%2C%22error%22%3Afalse%7D%5D%2C%22date_table.is_future_date%22%3A%5B%7B%22type%22%3A%22is%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22Yes%22%7D%2C%7B%7D%5D%2C%22id%22%3A5%2C%22error%22%3Afalse%7D%5D%2C%22let_events.status%22%3A%5B%7B%22type%22%3A%22%3D%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22Active%22%7D%2C%7B%7D%5D%2C%22id%22%3A6%2C%22error%22%3Afalse%7D%5D%7D&origin=share-expanded"
    }
    drill_fields: [county_geoid,let_events.count]
    html:
      <div style="background-color: #F6F6F7; height:500px;width:100%"></div>
      <div style="background-color: #F6F6F7; height:100%; width:100%; display:inline-block;"><center><font size="4"><strong>{{linked_value}} </strong></font><a style="display:inline-block;"><img src="https://i.ya-webdesign.com/images/three-dots-png-6.png" width="12px"></a></center></div>
      <div style="background-color: #F6F6F7; height:500px;width:100%"></div>;;
  }
  #F6F6F7

}

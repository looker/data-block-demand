- dashboard: area_120_demand_events
  title: 'Area 120: DEMAND Events'
  layout: newspaper
  elements:
  - title: Hub State 1
    name: Hub State 1
    model: demand_live_events
    explore: date_table
    type: single_value
    fields: [date_table.hub_state_selection]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    defaults_version: 1
    series_types: {}
    listen:
      First State: date_table.hub_state
    row: 5
    col: 0
    width: 6
    height: 2
  - title: Hub State 2
    name: Hub State 2
    model: demand_live_events
    explore: date_table
    type: single_value
    fields: [date_table.hub_state_selection]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    defaults_version: 1
    series_types: {}
    listen:
      Second State: date_table.hub_state
    row: 5
    col: 6
    width: 6
    height: 2
  - title: Hub State 3
    name: Hub State 3
    model: demand_live_events
    explore: date_table
    type: single_value
    fields: [date_table.hub_state_selection]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    defaults_version: 1
    series_types: {}
    listen:
      Third State: date_table.hub_state
    row: 5
    col: 12
    width: 6
    height: 2
  - title: Hub State 4
    name: Hub State 4
    model: demand_live_events
    explore: date_table
    type: single_value
    fields: [date_table.hub_state_selection]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    defaults_version: 1
    series_types: {}
    listen:
      Fourth State: date_table.hub_state
    row: 5
    col: 18
    width: 6
    height: 2
  - title: Active Live Events
    name: Active Live Events
    model: demand_live_events
    explore: date_table
    type: single_value
    fields: [let_events.count_active]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#4285F4"
    value_format: 0.0,"K"
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#4285F4",
        font_color: "#FFF", color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    series_types: {}
    defaults_version: 1
    listen:
      Date Range: date_table.calendar_date
    row: 0
    col: 4
    width: 3
    height: 2
  - title: Est Audience Size
    name: Est Audience Size
    model: demand_live_events
    explore: date_table
    type: single_value
    fields: [let_events.total_estimated_audience_size]
    filters:
      let_events.is_active: 'Yes'
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#EA4335"
    value_format: 0.0,,"M"
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#EA4335",
        font_color: "#FFF", color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    series_types: {}
    defaults_version: 1
    listen:
      Date Range: date_table.calendar_date
    row: 2
    col: 4
    width: 3
    height: 2
  - title: Total DMAs
    name: Total DMAs
    model: demand_live_events
    explore: date_table
    type: single_value
    fields: [let_events.count_market_areas]
    filters:
      let_events.is_active: 'Yes'
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#FBBC04"
    value_format: ''
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#FBBC04",
        font_color: "#FFF", color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    series_types: {}
    defaults_version: 1
    listen:
      Date Range: date_table.calendar_date
    row: 0
    col: 7
    width: 3
    height: 2
  - title: Cancellation Rate
    name: Cancellation Rate
    model: demand_live_events
    explore: date_table
    type: single_value
    fields: [let_events.cancellation_rate]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#34A853"
    value_format: ''
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#34A853",
        font_color: "#FFF", color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    series_types: {}
    defaults_version: 1
    listen:
      Date Range: date_table.calendar_date
    row: 2
    col: 7
    width: 3
    height: 2
  - title: US
    name: US
    model: demand_live_events
    explore: date_table
    type: looker_geo_choropleth
    fields: [let_events.count_active, date_table.state_name]
    sorts: [let_events.count_active desc]
    limit: 500
    column_limit: 50
    map: usa
    map_projection: ''
    show_view_names: false
    quantize_colors: false
    colors: ["#f9f9f9", "#4285F4", "#185ABC"]
    color_application:
      collection_id: google
      palette_id: google-sequential-0
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    title_hidden: true
    listen:
      Date Range: date_table.calendar_date
    row: 0
    col: 10
    width: 5
    height: 4
  - title: Event Status
    name: Event Status
    model: demand_live_events
    explore: date_table
    type: looker_column
    fields: [active_events, cancelled_2, date_table.calendar_week, postponed]
    fill_fields: [date_table.calendar_week]
    filters:
      date_table.is_future_date: 'Yes'
    sorts: [date_table.calendar_week desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: cancelled, label: Cancelled, expression: "${cancelled_2}*-1",
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}, {measure: active_events, based_on: let_events.count,
        label: Active Events, value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, _type_hint: number, filter_expression: '${let_events.status}=
          "Active"'}, {measure: cancelled_2, based_on: let_events.count, label: Cancelled,
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number, filter_expression: '${let_events.status} = "Cancelled"
          OR ${let_events.status} = "Inactive"'}, {measure: postponed, based_on: let_events.count,
        label: Postponed, value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number, filter_expression: '${let_events.status} = "Postponed"
          OR ${let_events.status} = "Rescheduled"'}, {table_calculation: postponed_3,
        label: Postponed, expression: "${postponed}*-1", value_format: !!null '',
        value_format_name: !!null '', _kind_hint: measure, _type_hint: number}]
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: google
      palette_id: google-categorical-0
      options:
        steps: 5
        reverse: false
    y_axes: [{label: '', orientation: left, series: [{axisId: active_events, id: active_events,
            name: Active Events}, {axisId: cancelledpostponed, id: cancelledpostponed,
            name: Cancelled}], showLabels: true, showValues: false, unpinAxis: false,
        tickDensity: custom, tickDensityCustom: 35, type: linear}, {label: '', orientation: right,
        series: [{axisId: sold, id: sold, name: "% of Seats Sold"}], showLabels: false,
        showValues: false, minValue: 0.8, unpinAxis: false, tickDensity: default,
        type: linear}]
    font_size: 70%
    label_value_format: 0.0,"K"
    series_types:
      mobility_data_core.retail_and_recreation_7_day_moving_avg: line
      flights_by_day_and_route.percent_sold: line
      sold: line
    series_colors:
      cancelledpostponed: "#FBBC04"
      sold: "#BDC1C6"
    series_labels:
      flights_by_day_and_route.percent_sold: "% of Seats Sold"
      cancelledpostponed: Cancelled
      sold: "% of Seats Sold"
    series_point_styles:
      flights_by_day_and_route.percent_sold: diamond
      sold: diamond
    label_color: [white, transparent, transparent]
    show_null_points: false
    interpolation: monotone
    defaults_version: 1
    hidden_fields: [cancelled_or_postponed, cancelled_2, postponed]
    title_hidden: true
    listen:
      Date Range: date_table.calendar_date
    row: 0
    col: 15
    width: 9
    height: 4
  - name: <a><img src="https://iibbco/wYYbBqB/Screen-Shot-2020-07-07-at-6-removebg-previewpng"
      height="80px" width="auto"></a>
    type: text
    title_text: <a><img src="https://i.ibb.co/wYYbBqB/Screen-Shot-2020-07-07-at-6-removebg-preview.png"
      height="80px" width="auto"></a>
    body_text: ''
    row: 0
    col: 0
    width: 4
    height: 4
  - title: 1) Events
    name: 1) Events
    model: demand_live_events
    explore: date_table
    type: single_value
    fields: [let_events.count_active, let_events.total_estimated_audience_size, let_events.cancellation_rate]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#4285F4"
    single_value_title: Events
    value_format: 0.0,"K"
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#4285F4",
        font_color: "#FFF", color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    series_types: {}
    defaults_version: 1
    hidden_fields: [let_events.total_estimated_audience_size, let_events.cancellation_rate]
    listen:
      First State: date_table.state_name
      Date Range: date_table.calendar_date
    row: 7
    col: 0
    width: 2
    height: 2
  - title: 1) Audience
    name: 1) Audience
    model: demand_live_events
    explore: date_table
    type: single_value
    fields: [let_events.count_active, let_events.total_estimated_audience_size, let_events.cancellation_rate]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#4285F4"
    single_value_title: Audience
    value_format: 0.0,,"M"
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#EA4335",
        font_color: "#FFF", color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    series_types: {}
    defaults_version: 1
    hidden_fields: [let_events.cancellation_rate, let_events.count_active]
    listen:
      First State: date_table.state_name
      Date Range: date_table.calendar_date
    row: 7
    col: 2
    width: 2
    height: 2
  - title: 1) Cancellation
    name: 1) Cancellation
    model: demand_live_events
    explore: date_table
    type: single_value
    fields: [let_events.count_active, let_events.total_estimated_audience_size, let_events.cancellation_rate]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#4285F4"
    single_value_title: "%Cancelled"
    value_format: ''
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#34A853",
        font_color: "#FFF", color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    series_types: {}
    defaults_version: 1
    hidden_fields: [let_events.count_active, let_events.total_estimated_audience_size]
    listen:
      First State: date_table.state_name
      Date Range: date_table.calendar_date
    row: 7
    col: 4
    width: 2
    height: 2
  - title: 2) Events
    name: 2) Events
    model: demand_live_events
    explore: date_table
    type: single_value
    fields: [let_events.count_active, let_events.total_estimated_audience_size, let_events.cancellation_rate]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#4285F4"
    single_value_title: Events
    value_format: 0.0,"K"
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#4285F4",
        font_color: "#FFF", color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    series_types: {}
    defaults_version: 1
    hidden_fields: [let_events.total_estimated_audience_size, let_events.cancellation_rate]
    listen:
      Second State: date_table.state_name
      Date Range: date_table.calendar_date
    row: 7
    col: 6
    width: 2
    height: 2
  - title: 3) Events
    name: 3) Events
    model: demand_live_events
    explore: date_table
    type: single_value
    fields: [let_events.count_active, let_events.total_estimated_audience_size, let_events.cancellation_rate]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#4285F4"
    single_value_title: Events
    value_format: 0.0,"K"
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#4285F4",
        font_color: "#FFF", color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    series_types: {}
    defaults_version: 1
    hidden_fields: [let_events.total_estimated_audience_size, let_events.cancellation_rate]
    listen:
      Third State: date_table.state_name
      Date Range: date_table.calendar_date
    row: 7
    col: 12
    width: 2
    height: 2
  - title: 4) Events
    name: 4) Events
    model: demand_live_events
    explore: date_table
    type: single_value
    fields: [let_events.count_active, let_events.total_estimated_audience_size, let_events.cancellation_rate]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#4285F4"
    single_value_title: Events
    value_format: 0.0,"K"
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#4285F4",
        font_color: "#FFF", color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    series_types: {}
    defaults_version: 1
    hidden_fields: [let_events.total_estimated_audience_size, let_events.cancellation_rate]
    listen:
      Fourth State: date_table.state_name
      Date Range: date_table.calendar_date
    row: 7
    col: 18
    width: 2
    height: 2
  - title: 2) Audience
    name: 2) Audience
    model: demand_live_events
    explore: date_table
    type: single_value
    fields: [let_events.count_active, let_events.total_estimated_audience_size, let_events.cancellation_rate]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#4285F4"
    single_value_title: Audience
    value_format: 0.0,,"M"
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#EA4335",
        font_color: "#FFF", color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    series_types: {}
    defaults_version: 1
    hidden_fields: [let_events.cancellation_rate, let_events.count_active]
    listen:
      Second State: date_table.state_name
      Date Range: date_table.calendar_date
    row: 7
    col: 8
    width: 2
    height: 2
  - title: 3) Audience
    name: 3) Audience
    model: demand_live_events
    explore: date_table
    type: single_value
    fields: [let_events.count_active, let_events.total_estimated_audience_size, let_events.cancellation_rate]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#4285F4"
    single_value_title: Audience
    value_format: 0.0,,"M"
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#EA4335",
        font_color: "#FFF", color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    series_types: {}
    defaults_version: 1
    hidden_fields: [let_events.cancellation_rate, let_events.count_active]
    listen:
      Third State: date_table.state_name
      Date Range: date_table.calendar_date
    row: 7
    col: 14
    width: 2
    height: 2
  - title: 4) Audience
    name: 4) Audience
    model: demand_live_events
    explore: date_table
    type: single_value
    fields: [let_events.count_active, let_events.total_estimated_audience_size, let_events.cancellation_rate]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#4285F4"
    single_value_title: Audience
    value_format: 0.0,,"M"
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#EA4335",
        font_color: "#FFF", color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    series_types: {}
    defaults_version: 1
    hidden_fields: [let_events.cancellation_rate, let_events.count_active]
    listen:
      Fourth State: date_table.state_name
      Date Range: date_table.calendar_date
    row: 7
    col: 20
    width: 2
    height: 2
  - title: 2) Cancellation
    name: 2) Cancellation
    model: demand_live_events
    explore: date_table
    type: single_value
    fields: [let_events.count_active, let_events.total_estimated_audience_size, let_events.cancellation_rate]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#4285F4"
    single_value_title: "%Cancelled"
    value_format: ''
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#34A853",
        font_color: "#FFF", color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    series_types: {}
    defaults_version: 1
    hidden_fields: [let_events.count_active, let_events.total_estimated_audience_size]
    listen:
      Second State: date_table.state_name
      Date Range: date_table.calendar_date
    row: 7
    col: 10
    width: 2
    height: 2
  - title: 3) Cancellation
    name: 3) Cancellation
    model: demand_live_events
    explore: date_table
    type: single_value
    fields: [let_events.count_active, let_events.total_estimated_audience_size, let_events.cancellation_rate]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#4285F4"
    single_value_title: "%Cancelled"
    value_format: ''
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#34A853",
        font_color: "#FFF", color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    series_types: {}
    defaults_version: 1
    hidden_fields: [let_events.count_active, let_events.total_estimated_audience_size]
    listen:
      Third State: date_table.state_name
      Date Range: date_table.calendar_date
    row: 7
    col: 16
    width: 2
    height: 2
  - title: 4) Cancellation
    name: 4) Cancellation
    model: demand_live_events
    explore: date_table
    type: single_value
    fields: [let_events.count_active, let_events.total_estimated_audience_size, let_events.cancellation_rate]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#4285F4"
    single_value_title: "%Cancelled"
    value_format: ''
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#34A853",
        font_color: "#FFF", color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    series_types: {}
    defaults_version: 1
    hidden_fields: [let_events.count_active, let_events.total_estimated_audience_size]
    listen:
      Fourth State: date_table.state_name
      Date Range: date_table.calendar_date
    row: 7
    col: 22
    width: 2
    height: 2
  - title: 1) County
    name: 1) County
    model: demand_live_events
    explore: date_table
    type: looker_map
    fields: [date_table.county_geoid, let_events.count_active]
    limit: 500
    map_plot_mode: points
    heatmap_gridlines: true
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.7
    show_region_field: true
    draw_map_labels_above_data: false
    map_tile_provider: light
    map_position: fit_data
    map_scale_indicator: 'off'
    map_pannable: false
    map_zoomable: false
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_view_names: false
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    map_value_colors: ["#4285F4", "#EA4335", "#FBBC04", "#34A853"]
    color_application:
      collection_id: google
      palette_id: google-categorical-0
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    map: usa
    map_projection: ''
    title_hidden: true
    listen:
      First State: date_table.state_name
      Date Range: date_table.calendar_date
    row: 12
    col: 0
    width: 6
    height: 6
  - title: 2) County
    name: 2) County
    model: demand_live_events
    explore: date_table
    type: looker_map
    fields: [date_table.county_geoid, let_events.count_active]
    limit: 500
    map_plot_mode: points
    heatmap_gridlines: true
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.7
    show_region_field: true
    draw_map_labels_above_data: false
    map_tile_provider: light
    map_position: fit_data
    map_scale_indicator: 'off'
    map_pannable: false
    map_zoomable: false
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_view_names: false
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    map_value_colors: ["#4285F4", "#EA4335", "#FBBC04", "#34A853"]
    color_application:
      collection_id: google
      palette_id: google-categorical-0
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    map: usa
    map_projection: ''
    title_hidden: true
    listen:
      Second State: date_table.state_name
      Date Range: date_table.calendar_date
    row: 12
    col: 6
    width: 6
    height: 6
  - title: 3) County
    name: 3) County
    model: demand_live_events
    explore: date_table
    type: looker_map
    fields: [date_table.county_geoid, let_events.count_active]
    limit: 500
    map_plot_mode: points
    heatmap_gridlines: true
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.7
    show_region_field: true
    draw_map_labels_above_data: false
    map_tile_provider: light
    map_position: fit_data
    map_scale_indicator: 'off'
    map_pannable: false
    map_zoomable: false
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_view_names: false
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    map_value_colors: ["#4285F4", "#EA4335", "#FBBC04", "#34A853"]
    color_application:
      collection_id: google
      palette_id: google-categorical-0
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    map: usa
    map_projection: ''
    title_hidden: true
    listen:
      Third State: date_table.state_name
      Date Range: date_table.calendar_date
    row: 12
    col: 12
    width: 6
    height: 6
  - title: 4) County
    name: 4) County
    model: demand_live_events
    explore: date_table
    type: looker_map
    fields: [let_events.count_active, date_table.county_geoid]
    sorts: [let_events.count_active desc]
    limit: 500
    map_plot_mode: points
    heatmap_gridlines: true
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.7
    show_region_field: true
    draw_map_labels_above_data: false
    map_tile_provider: light
    map_position: fit_data
    map_scale_indicator: 'off'
    map_pannable: false
    map_zoomable: false
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_view_names: false
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    map_value_colors: ["#4285F4", "#EA4335", "#FBBC04", "#34A853"]
    color_application:
      collection_id: google
      palette_id: google-categorical-0
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    map: usa
    map_projection: ''
    title_hidden: true
    listen:
      Fourth State: date_table.state_name
      Date Range: date_table.calendar_date
    row: 12
    col: 18
    width: 6
    height: 6
  - title: 1) Covid
    name: 1) Covid
    model: demand_live_events
    explore: date_table
    type: looker_line
    fields: [date_table.calendar_date, us_counties.total_confirmed_cases, mobility_data_core.residential_7_day_moving_avg,
      mobility_data_core.transit_stations_7_day_moving_avg]
    filters:
      date_table.calendar_date: 30 days
    sorts: [date_table.calendar_date]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: new_cases, label: New Cases, expression: 'if(is_null(${mobility_data_core.residential_7_day_moving_avg}),null,if(${us_counties.total_confirmed_cases}=0,0,${us_counties.total_confirmed_cases}-offset(${us_counties.total_confirmed_cases},-1)))',
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}]
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: false
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: true
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: step-after
    color_application:
      collection_id: google
      palette_id: google-categorical-0
      options:
        steps: 5
        reverse: false
    y_axes: [{label: !!null '', orientation: left, series: [{axisId: new_cases, id: new_cases,
            name: Covid-19 Cases}], showLabels: false, showValues: false, maxValue: !!null '',
        minValue: !!null '', unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: right, series: [{axisId: mobility_data_core.residential_7_day_moving_avg,
            id: mobility_data_core.residential_7_day_moving_avg, name: Stay At Home}],
        showLabels: false, showValues: false, maxValue: !!null '', minValue: !!null '',
        valueFormat: 0%, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    limit_displayed_rows_values:
      show_hide: hide
      first_last: last
      num_rows: '5'
    font_size: 80%
    label_value_format: 0.0,"K"
    series_types:
      new_cases: column
    series_colors:
      new_cases: "#4285F4"
      mobility_data_core.residential_7_day_moving_avg: "#FBBC04"
    series_labels:
      mobility_data_core.transit_stations_7_day_moving_avg: Transportation Use
      mobility_data_core.residential_7_day_moving_avg: Stay At Home
      new_cases: Covid-19 Cases
    label_color: [transparent, black]
    x_axis_datetime_label: "%b %d"
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: [us_counties.total_confirmed_cases, mobility_data_core.transit_stations_7_day_moving_avg]
    title_hidden: true
    listen:
      First State: date_table.state_name
    row: 18
    col: 0
    width: 6
    height: 6
  - title: 2) Covid
    name: 2) Covid
    model: demand_live_events
    explore: date_table
    type: looker_line
    fields: [date_table.calendar_date, us_counties.total_confirmed_cases, mobility_data_core.residential_7_day_moving_avg,
      mobility_data_core.transit_stations_7_day_moving_avg]
    filters:
      date_table.calendar_date: 30 days
    sorts: [date_table.calendar_date]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: new_cases, label: New Cases, expression: 'if(is_null(${mobility_data_core.residential_7_day_moving_avg}),null,if(${us_counties.total_confirmed_cases}=0,0,${us_counties.total_confirmed_cases}-offset(${us_counties.total_confirmed_cases},-1)))',
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}]
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: false
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: true
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: step-after
    color_application:
      collection_id: google
      palette_id: google-categorical-0
      options:
        steps: 5
        reverse: false
    y_axes: [{label: !!null '', orientation: left, series: [{axisId: new_cases, id: new_cases,
            name: Covid-19 Cases}], showLabels: false, showValues: false, maxValue: !!null '',
        minValue: !!null '', unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: right, series: [{axisId: mobility_data_core.residential_7_day_moving_avg,
            id: mobility_data_core.residential_7_day_moving_avg, name: Stay At Home}],
        showLabels: false, showValues: false, maxValue: !!null '', minValue: !!null '',
        valueFormat: 0%, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    limit_displayed_rows_values:
      show_hide: hide
      first_last: last
      num_rows: '5'
    font_size: 80%
    label_value_format: 0.0,"K"
    series_types:
      new_cases: column
    series_colors:
      new_cases: "#4285F4"
      mobility_data_core.residential_7_day_moving_avg: "#FBBC04"
    series_labels:
      mobility_data_core.transit_stations_7_day_moving_avg: Transportation Use
      mobility_data_core.residential_7_day_moving_avg: Stay At Home
      new_cases: Covid-19 Cases
    label_color: [transparent, black]
    x_axis_datetime_label: "%b %d"
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: [us_counties.total_confirmed_cases, mobility_data_core.transit_stations_7_day_moving_avg]
    title_hidden: true
    listen:
      Second State: date_table.state_name
    row: 18
    col: 6
    width: 6
    height: 6
  - title: 3) Covid
    name: 3) Covid
    model: demand_live_events
    explore: date_table
    type: looker_line
    fields: [date_table.calendar_date, us_counties.total_confirmed_cases, mobility_data_core.residential_7_day_moving_avg,
      mobility_data_core.transit_stations_7_day_moving_avg]
    filters:
      date_table.calendar_date: 30 days
    sorts: [date_table.calendar_date]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: new_cases, label: New Cases, expression: 'if(is_null(${mobility_data_core.residential_7_day_moving_avg}),null,if(${us_counties.total_confirmed_cases}=0,0,${us_counties.total_confirmed_cases}-offset(${us_counties.total_confirmed_cases},-1)))',
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}]
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: false
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: true
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: step-after
    color_application:
      collection_id: google
      palette_id: google-categorical-0
      options:
        steps: 5
        reverse: false
    y_axes: [{label: !!null '', orientation: left, series: [{axisId: new_cases, id: new_cases,
            name: Covid-19 Cases}], showLabels: false, showValues: false, maxValue: !!null '',
        minValue: !!null '', unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: right, series: [{axisId: mobility_data_core.residential_7_day_moving_avg,
            id: mobility_data_core.residential_7_day_moving_avg, name: Stay At Home}],
        showLabels: false, showValues: false, maxValue: !!null '', minValue: !!null '',
        valueFormat: 0%, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    limit_displayed_rows_values:
      show_hide: hide
      first_last: last
      num_rows: '5'
    font_size: 80%
    label_value_format: 0.0,"K"
    series_types:
      new_cases: column
    series_colors:
      new_cases: "#4285F4"
      mobility_data_core.residential_7_day_moving_avg: "#FBBC04"
    series_labels:
      mobility_data_core.transit_stations_7_day_moving_avg: Transportation Use
      mobility_data_core.residential_7_day_moving_avg: Stay At Home
      new_cases: Covid-19 Cases
    label_color: [transparent, black]
    x_axis_datetime_label: "%b %d"
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: [us_counties.total_confirmed_cases, mobility_data_core.transit_stations_7_day_moving_avg]
    title_hidden: true
    listen:
      Third State: date_table.state_name
    row: 18
    col: 12
    width: 6
    height: 6
  - title: 4) Covid
    name: 4) Covid
    model: demand_live_events
    explore: date_table
    type: looker_line
    fields: [date_table.calendar_date, us_counties.total_confirmed_cases, mobility_data_core.residential_7_day_moving_avg,
      mobility_data_core.transit_stations_7_day_moving_avg]
    filters:
      date_table.calendar_date: 30 days
    sorts: [date_table.calendar_date]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: new_cases, label: New Cases, expression: 'if(is_null(${mobility_data_core.residential_7_day_moving_avg}),null,if(${us_counties.total_confirmed_cases}=0,0,${us_counties.total_confirmed_cases}-offset(${us_counties.total_confirmed_cases},-1)))',
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}]
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: false
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: true
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: step-after
    color_application:
      collection_id: google
      palette_id: google-categorical-0
      options:
        steps: 5
        reverse: false
    y_axes: [{label: !!null '', orientation: left, series: [{axisId: new_cases, id: new_cases,
            name: Covid-19 Cases}], showLabels: false, showValues: false, maxValue: !!null '',
        minValue: !!null '', unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: right, series: [{axisId: mobility_data_core.residential_7_day_moving_avg,
            id: mobility_data_core.residential_7_day_moving_avg, name: Stay At Home}],
        showLabels: false, showValues: false, maxValue: !!null '', minValue: !!null '',
        valueFormat: 0%, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    limit_displayed_rows_values:
      show_hide: hide
      first_last: last
      num_rows: '5'
    font_size: 80%
    label_value_format: 0.0,"K"
    series_types:
      new_cases: column
    series_colors:
      new_cases: "#4285F4"
      mobility_data_core.residential_7_day_moving_avg: "#FBBC04"
    series_labels:
      mobility_data_core.transit_stations_7_day_moving_avg: Transportation Use
      mobility_data_core.residential_7_day_moving_avg: Stay At Home
      new_cases: Covid-19 Cases
    label_color: [transparent, black]
    x_axis_datetime_label: "%b %d"
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: [us_counties.total_confirmed_cases, mobility_data_core.transit_stations_7_day_moving_avg]
    title_hidden: true
    listen:
      Fourth State: date_table.state_name
    row: 18
    col: 18
    width: 6
    height: 6
  - title: 1) Category
    name: 1) Category
    model: demand_live_events
    explore: date_table
    type: looker_pie
    fields: [category, let_events.count_active]
    filters:
      let_events.top_tier_catgory: "-NULL"
    sorts: [let_events.count_active desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{dimension: category, label: Category, expression: 'if(${let_events.top_tier_catgory}="Theatre(Arts)"
          OR ${let_events.top_tier_catgory}="Arts & Theatre" OR ${let_events.top_tier_catgory}="Theater
          and Arts","Arts & Theatre",${let_events.top_tier_catgory})', value_format: !!null '',
        value_format_name: !!null '', _kind_hint: dimension, _type_hint: string}]
    value_labels: legend
    label_type: labPer
    inner_radius: 55
    series_types: {}
    defaults_version: 1
    hidden_fields: []
    title_hidden: true
    listen:
      First State: date_table.state_name
      Date Range: date_table.calendar_date
    row: 24
    col: 0
    width: 6
    height: 6
  - title: 2) Category
    name: 2) Category
    model: demand_live_events
    explore: date_table
    type: looker_pie
    fields: [category, let_events.count_active]
    filters:
      let_events.top_tier_catgory: "-NULL"
    sorts: [let_events.count_active desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{dimension: category, label: Category, expression: 'if(${let_events.top_tier_catgory}="Theatre(Arts)"
          OR ${let_events.top_tier_catgory}="Arts & Theatre" OR ${let_events.top_tier_catgory}="Theater
          and Arts","Arts & Theatre",${let_events.top_tier_catgory})', value_format: !!null '',
        value_format_name: !!null '', _kind_hint: dimension, _type_hint: string}]
    value_labels: legend
    label_type: labPer
    inner_radius: 55
    series_types: {}
    defaults_version: 1
    hidden_fields: []
    title_hidden: true
    listen:
      Second State: date_table.state_name
      Date Range: date_table.calendar_date
    row: 24
    col: 6
    width: 6
    height: 6
  - title: 3) Category
    name: 3) Category
    model: demand_live_events
    explore: date_table
    type: looker_pie
    fields: [category, let_events.count_active]
    filters:
      let_events.top_tier_catgory: "-NULL"
    sorts: [let_events.count_active desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{dimension: category, label: Category, expression: 'if(${let_events.top_tier_catgory}="Theatre(Arts)"
          OR ${let_events.top_tier_catgory}="Arts & Theatre" OR ${let_events.top_tier_catgory}="Theater
          and Arts","Arts & Theatre",${let_events.top_tier_catgory})', value_format: !!null '',
        value_format_name: !!null '', _kind_hint: dimension, _type_hint: string}]
    value_labels: legend
    label_type: labPer
    inner_radius: 55
    series_types: {}
    defaults_version: 1
    hidden_fields: []
    title_hidden: true
    listen:
      Third State: date_table.state_name
      Date Range: date_table.calendar_date
    row: 24
    col: 12
    width: 6
    height: 6
  - title: 4) Category
    name: 4) Category
    model: demand_live_events
    explore: date_table
    type: looker_pie
    fields: [category, let_events.count_active]
    filters:
      let_events.top_tier_catgory: "-NULL"
    sorts: [let_events.count_active desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{dimension: category, label: Category, expression: 'if(${let_events.top_tier_catgory}="Theatre(Arts)"
          OR ${let_events.top_tier_catgory}="Arts & Theatre" OR ${let_events.top_tier_catgory}="Theater
          and Arts","Arts & Theatre",${let_events.top_tier_catgory})', value_format: !!null '',
        value_format_name: !!null '', _kind_hint: dimension, _type_hint: string}]
    value_labels: legend
    label_type: labPer
    inner_radius: 55
    series_types: {}
    defaults_version: 1
    hidden_fields: []
    title_hidden: true
    listen:
      Fourth State: date_table.state_name
      Date Range: date_table.calendar_date
    row: 24
    col: 18
    width: 6
    height: 6
  - title: 1) Top Events
    name: 1) Top Events
    model: demand_live_events
    explore: date_table
    type: looker_grid
    fields: [let_events.total_estimated_audience_size, let_events.name, let_events.dma_name]
    sorts: [let_events.total_estimated_audience_size desc]
    limit: 6
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: unstyled
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: center
    header_font_size: '11'
    rows_font_size: '11'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    pinned_columns:
      let_events.name: left
      let_events.total_estimated_audience_size: left
      let_events.dma_name: left
    column_order: [let_events.name, let_events.dma_name, let_events.total_estimated_audience_size]
    show_totals: true
    show_row_totals: true
    series_labels:
      let_events.total_estimated_audience_size: Audience
    series_column_widths:
      let_events.name: 185
      let_events.venue: 118
      let_events.total_estimated_audience_size: 133
      let_events.dma_name: 128
    series_cell_visualizations:
      let_events.total_estimated_audience_size:
        is_active: true
        value_display: true
    header_font_color: "#E8EAED"
    header_background_color: "#FBBC04"
    conditional_formatting: []
    series_value_format:
      let_events.total_estimated_audience_size: 0.00,,"M"
    series_types: {}
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    title_hidden: true
    listen:
      First State: date_table.state_name
      Date Range: date_table.calendar_date
    row: 9
    col: 0
    width: 6
    height: 3
  - title: 2) Top Events
    name: 2) Top Events
    model: demand_live_events
    explore: date_table
    type: looker_grid
    fields: [let_events.total_estimated_audience_size, let_events.name, let_events.dma_name]
    sorts: [let_events.total_estimated_audience_size desc]
    limit: 6
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: unstyled
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: center
    header_font_size: '11'
    rows_font_size: '11'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    pinned_columns:
      let_events.name: left
      let_events.total_estimated_audience_size: left
      let_events.dma_name: left
    column_order: [let_events.name, let_events.dma_name, let_events.total_estimated_audience_size]
    show_totals: true
    show_row_totals: true
    series_labels:
      let_events.total_estimated_audience_size: Audience
    series_column_widths:
      let_events.name: 185
      let_events.venue: 118
      let_events.total_estimated_audience_size: 133
      let_events.dma_name: 128
    series_cell_visualizations:
      let_events.total_estimated_audience_size:
        is_active: true
        value_display: true
    header_font_color: "#E8EAED"
    header_background_color: "#FBBC04"
    conditional_formatting: []
    series_value_format:
      let_events.total_estimated_audience_size: 0.00,,"M"
    series_types: {}
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    title_hidden: true
    listen:
      Second State: date_table.state_name
      Date Range: date_table.calendar_date
    row: 9
    col: 6
    width: 6
    height: 3
  - title: 3) Top Events
    name: 3) Top Events
    model: demand_live_events
    explore: date_table
    type: looker_grid
    fields: [let_events.total_estimated_audience_size, let_events.name, let_events.dma_name]
    sorts: [let_events.total_estimated_audience_size desc]
    limit: 6
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: unstyled
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: center
    header_font_size: '11'
    rows_font_size: '11'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    pinned_columns:
      let_events.name: left
      let_events.total_estimated_audience_size: left
      let_events.dma_name: left
    column_order: [let_events.name, let_events.dma_name, let_events.total_estimated_audience_size]
    show_totals: true
    show_row_totals: true
    series_labels:
      let_events.total_estimated_audience_size: Audience
    series_column_widths:
      let_events.name: 185
      let_events.venue: 118
      let_events.total_estimated_audience_size: 133
      let_events.dma_name: 128
    series_cell_visualizations:
      let_events.total_estimated_audience_size:
        is_active: true
        value_display: true
    header_font_color: "#E8EAED"
    header_background_color: "#FBBC04"
    conditional_formatting: []
    series_value_format:
      let_events.total_estimated_audience_size: 0.00,,"M"
    series_types: {}
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    title_hidden: true
    listen:
      Third State: date_table.state_name
      Date Range: date_table.calendar_date
    row: 9
    col: 12
    width: 6
    height: 3
  - title: 4) Top Events
    name: 4) Top Events
    model: demand_live_events
    explore: date_table
    type: looker_grid
    fields: [let_events.total_estimated_audience_size, let_events.name, let_events.dma_name]
    sorts: [let_events.total_estimated_audience_size desc]
    limit: 6
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: unstyled
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: center
    header_font_size: '11'
    rows_font_size: '11'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    pinned_columns:
      let_events.name: left
      let_events.total_estimated_audience_size: left
      let_events.dma_name: left
    column_order: [let_events.name, let_events.dma_name, let_events.total_estimated_audience_size]
    show_totals: true
    show_row_totals: true
    series_labels:
      let_events.total_estimated_audience_size: Audience
    series_column_widths:
      let_events.name: 185
      let_events.venue: 118
      let_events.total_estimated_audience_size: 133
      let_events.dma_name: 128
    series_cell_visualizations:
      let_events.total_estimated_audience_size:
        is_active: true
        value_display: true
    header_font_color: "#E8EAED"
    header_background_color: "#FBBC04"
    conditional_formatting: []
    series_value_format:
      let_events.total_estimated_audience_size: 0.00,,"M"
    series_types: {}
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    title_hidden: true
    listen:
      Fourth State: date_table.state_name
      Date Range: date_table.calendar_date
    row: 9
    col: 18
    width: 6
    height: 3
  - name: "<hr>"
    type: text
    title_text: "<hr>"
    row: 4
    col: 0
    width: 24
    height: 1
  filters:
  - name: First State
    title: First State
    type: field_filter
    default_value: Nevada
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: demand_live_events
    explore: date_table
    listens_to_filters: []
    field: date_table.hub_state
  - name: Second State
    title: Second State
    type: field_filter
    default_value: California
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: demand_live_events
    explore: date_table
    listens_to_filters: []
    field: date_table.hub_state
  - name: Third State
    title: Third State
    type: field_filter
    default_value: New York
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: demand_live_events
    explore: date_table
    listens_to_filters: []
    field: date_table.hub_state
  - name: Fourth State
    title: Fourth State
    type: field_filter
    default_value: Texas
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: demand_live_events
    explore: date_table_hotel
    listens_to_filters: []
    field: date_table.hub_state
  - name: Date Range
    title: Date Range
    type: date_filter
    default_value: before 3 months from now
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover

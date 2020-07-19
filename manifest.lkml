project_name: "data-block-demand"

constant: CONNECTION_NAME {
  value: "brick-layer"
  export: override_required
}
constant: CONFIG_PROJECT_NAME {
  value: "data-block-demand-config"
  export: override_required
}
constant: DEMAND_SCHEMA_NAME {
  value: "demand-public.let_looker"
  export: override_required
}

local_dependency: {
  project: "@{CONFIG_PROJECT_NAME}"
  override_constant: DEMAND_SCHEMA_NAME {
    value: "@{DEMAND_SCHEMA_NAME}"
  }
}

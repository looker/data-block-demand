connection: "@{CONNECTION_NAME}"
include: "/views/*.view.lkml"
include: "*.explore.lkml"
include: "*.dashboard.lookml"
include: "//@{CONFIG_PROJECT_NAME}/*.view.lkml"
include: "//@{CONFIG_PROJECT_NAME}/*.model.lkml"
include: "//@{CONFIG_PROJECT_NAME}/*.dashboard"

persist_for: "48 hours"


explore: let_livestream {
  extends: [let_livestream_config]
}

explore: historical_sample {
  extends: [historical_sample_config]
}

explore: date_table {
  extends: [date_table_config]
}

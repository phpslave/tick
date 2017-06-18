provider "grafana" {
  url  = "http://localhost:3000"
  auth = "admin:admin"
}

resource "grafana_data_source" "metrics" {
  type          = "influxdb"
  name          = "influxdb-metrics"
  url           = "http://pythian_influxdb:8086/"
  database_name = "telegraf"
  is_default    = "true"
}

resource "grafana_dashboard" "metrics" {
  config_json = "${file("grafana/grafana-testing-dashboard.json")}"
}

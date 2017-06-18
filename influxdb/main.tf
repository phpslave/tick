provider "influxdb" {
    url = "http://localhost:8086/"
}

resource "influxdb_database" "metrics" {
    name = "telegraf"
}

resource "influxdb_user" "tick_user" {
    name = "tick_user"
    password = "tickticktick"
}
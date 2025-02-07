
resource "null_resource" "previous" {}

resource "time_sleep" "wait_5_seconds" {
  depends_on = [null_resource.previous]

  create_duration = "5s"
}

resource "null_resource" "next" {
  depends_on = [time_sleep.wait_5_seconds]
}

output "creation_time" {
    value = time_sleep.wait_5_seconds.create_duration
}

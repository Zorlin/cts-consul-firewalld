log_level   = "INFO"
working_dir = "sync-tasks"  # Replace with the absolute path to your working directory
port        = 8558

syslog {}

buffer_period {
  enabled = true
  min     = "5s"
  max     = "20s"
}

consul {
  address = "localhost:8500"
}

driver "terraform" {
  # version = "0.14.0"
  # path = ""
  log         = false
  persist_log = false

  backend "consul" {
    gzip = true
  }
}

task {
  name        = "firewall-task"
  description = "Setup firewalld with Terraform"
  module = "github.com/Zorlin/terraform-consul-firewalld"
}

terraform {
  required_providers {
    null = {
      source = "hashicorp/null"
      version = "3.2.1"
    }
  }
}

resource "random_string" "test" {
  length           = 16
  special          = true
  override_special = "/@£$"
}

output "test" {
  value = random_string.test.id
}

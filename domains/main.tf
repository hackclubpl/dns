terraform {
  backend "remote" {
    organization = "hackclubpl"

    workspaces {
      name = "domains"
    }
  }

  required_providers {
    cloudflare = {
      source = "terraform-providers/cloudflare"
    }
  }
}

variable "cloudflare_email" {}
variable "cloudflare_api_key" {}

provider "cloudflare" {
  email   = var.cloudflare_email
  api_key = var.cloudflare_api_key
}

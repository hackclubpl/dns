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

variable "vercel_ip_address" {
  default = "76.76.21.21"
}

variable "hackclub_main_domain" {
  default = cloudflare_zone.hackclubpl.zone
}

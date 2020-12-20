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

# Used for redirects
variable "hackclub_main_domain" {
  default = "hackclub.pl"
}

variable "vercel_ip_address" {
  default = "76.76.21.21"
}

variable "vercel_cname" {
  default = "cname.vercel-dns.com"
}

variable "shortio_ip_address_1" {
  default = "18.184.197.212"
}

variable "shortio_ip_address_2" {
  default = "52.59.165.42"
}


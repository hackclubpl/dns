terraform {
  required_providers {
    cloudflare = {
      source = "terraform-providers/cloudflare"
    }
  }
}

provider "cloudflare" {
  email   = var.CLOUDFLARE_EMAIL
  api_key = var.CLOUDFLARE_API_KEY
}

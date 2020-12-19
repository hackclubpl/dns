variable "cloudflare_email" {}
variable "cloudflare_api_key" {}

module "domains" {
  source = "./domains"
  cloudflare_email = var.cloudflare_email
  cloudflare_api_key = var.cloudflare_api_key
}

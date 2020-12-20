resource "cloudflare_zone" "hkclpl" {
  zone = "hkcl.pl"
}

resource "cloudflare_record" "hkclpl_a_main" {
  zone_id = cloudflare_zone.hkclpl.id

  name  = "@"
  type  = "A"
  value = var.shortio_ip_address_1

  proxied = true
}

resource "cloudflare_record" "hkclpl_a_secondary" {
  zone_id = cloudflare_zone.hkclpl.id

  name  = "@"
  type  = "A"
  value = var.shortio_ip_address_2

  proxied = true
}

resource "cloudflare_record" "hkclpl_a_www" {
  zone_id = cloudflare_zone.hkclpl.id

  name  = "www"
  type  = "A"
  value = var.shortio_ip_address_1

  proxied = true
}

resource "cloudflare_record" "hkclpl_a_www_secondary" {
  zone_id = cloudflare_zone.hkclpl.id

  name  = "www"
  type  = "A"
  value = var.shortio_ip_address_2

  proxied = true
}

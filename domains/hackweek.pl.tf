resource "cloudflare_zone" "hackweekpl" {
  zone = "hackweek.pl"
}

resource "cloudflare_record" "hackclubweek_a_main" {
  zone_id = cloudflare_zone.hackweekpl.id

  name  = "@"
  type  = "A"
  value = "165.227.12.111"

  proxied = true
}

resource "cloudflare_record" "hackweek_a_www" {
  zone_id = cloudflare_zone.hackweekpl.id

  name  = "www"
  type  = "A"
  value = "165.227.12.111"

  proxied = true
}

resource "cloudflare_record" "hackweek_a_next" {
  zone_id = cloudflare_zone.hackweekpl.id

  name  = "next"
  type  = "A"
  value = "104.248.78.24"

  proxied = true
}

resource "cloudflare_zone" "hackclubrocks" {
  zone = "hackclub.rocks"
}

resource "cloudflare_record" "hackclubrocks_a_main" {
  zone_id = cloudflare_zone.hackclubrocks.id

  name  = "@"
  type  = "A"
  value = cloudflare_record.hackclubpl_a_main.value

  proxied = true
}

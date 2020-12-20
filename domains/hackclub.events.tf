resource "cloudflare_zone" "hackclubevents" {
  zone = "hackclub.events"
}

# Cloudflare requires proxied record to enable page rules
resource "cloudflare_record" "hackclubevents_a_main" {
  zone_id = cloudflare_zone.hackclubevents.id

  name  = "@"
  type  = "A"
  value = var.vercel_ip_address

  proxied = true
}

resource "cloudflare_page_rule" "hackclubevents_redirect" {
  zone_id = cloudflare_zone.hackclubevents.id
  target  = "*${cloudflare_zone.hackclubevents.zone}/*"

  actions {
    forwarding_url {
      status_code = 302
      url         = "https://${var.hackclub_main_domain}"
    }
  }
}

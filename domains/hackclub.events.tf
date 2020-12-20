resource "cloudflare_zone" "hackclubevents" {
  zone = "hackclub.events"
}

resource "cloudflare_page_rule" "hackclubevents_redirect" {
  zone_id = cloudflare_zone.hackclubevents.id
  target  = "*${cloudflare_zone.hackclubevents.zone}/*"

  actions {
    forwarding_url {
      status_code = 302
      url         = "https://hackclub.pl"
    }
  }
}

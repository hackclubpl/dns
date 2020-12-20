resource "cloudflare_zone" "hackclubblog" {
  zone = "hackclub.blog"
}

resource "cloudflare_page_rule" "hackclubblog_redirect" {
  zone_id = cloudflare_zone.hackclubblog.id
  target = "*${cloudflare_zone.hackclubpl.zone}/*"

  actions {
    forwarding_url {
      status_code = 302
      url = "https://hackclub.pl"
    }
  }
}

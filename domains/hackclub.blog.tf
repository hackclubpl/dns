resource "cloudflare_zone" "hackclubblog" {
  zone = "hackclub.blog"
}

# Cloudflare requires proxied record to enable page rules
resource "cloudflare_record" "hackclubblog_a_main" {
  zone_id = cloudflare_zone.hackclubblog.id

  name  = "@"
  type  = "A"
  value = var.vercel_ip_address

  proxied = true
}

resource "cloudflare_record" "hackclubblog_a_www" {
  zone_id = cloudflare_zone.hackclubblog.id

  name  = "www"
  type  = "A"
  value = var.vercel_ip_address

  proxied = true
}

resource "cloudflare_page_rule" "hackclubblog_redirect" {
  zone_id = cloudflare_zone.hackclubblog.id
  target  = "*${cloudflare_zone.hackclubblog.zone}/*"

  actions {
    forwarding_url {
      status_code = 302
      url         = "https://${var.hackclub_main_domain}"
    }
  }
}

resource "cloudflare_zone" "hackclubpl" {
  zone = "hackclub.pl"
}

resource "cloudflare_record" "hackclubpl_a_main" {
  zone_id = cloudflare_zone.hackclubpl.id

  name  = "@"
  type  = "A"
  value = var.vercel_ip_address

  proxied = true
}

resource "cloudflare_record" "hackclubpl_a_www" {
  zone_id = cloudflare_zone.hackclubpl.id

  name  = "www"
  type  = "A"
  value = var.vercel_ip_address

  proxied = true
}

# Cloudflare requires proxied record to enable page rule for it
resource "cloudflare_record" "hackclubpl_cname_warsaw" {
  zone_id = cloudflare_zone.hackclubpl.id

  name  = "warsaw"
  type  = "CNAME"
  value = var.vercel_cname

  proxied = true
}

resource "cloudflare_page_rule" "hackclubpl_warsaw_redirect" {
  zone_id = cloudflare_zone.hackclubpl.id
  target  = "*warsaw.${var.hackclub_main_domain}/*"

  actions {
    forwarding_url {
      status_code = 302
      url         = "https://hackclub.pl"
    }
  }
}

# Google Workspace config

resource "cloudflare_record" "hackclubpl_mx_aspmx" {
  zone_id = cloudflare_zone.hackclubpl.id

  name     = "@"
  type     = "MX"
  value    = "aspmx.l.google.com"
  priority = 1
}

resource "cloudflare_record" "hackclubpl_mx_aspmx_alt1" {
  zone_id = cloudflare_zone.hackclubpl.id

  name     = "@"
  type     = "MX"
  value    = "alt1.aspmx.l.google.com"
  priority = 5
}

resource "cloudflare_record" "hackclubpl_mx_aspmx_alt2" {
  zone_id = cloudflare_zone.hackclubpl.id

  name     = "@"
  type     = "MX"
  value    = "alt2.aspmx.l.google.com"
  priority = 5
}

resource "cloudflare_record" "hackclubpl_mx_aspmx_alt3" {
  zone_id = cloudflare_zone.hackclubpl.id

  name     = "@"
  type     = "MX"
  value    = "alt3.aspmx.l.google.com"
  priority = 10
}

resource "cloudflare_record" "hackclubpl_mx_aspmx_alt4" {
  zone_id = cloudflare_zone.hackclubpl.id

  name     = "@"
  type     = "MX"
  value    = "alt4.aspmx.l.google.com"
  priority = 10
}

resource "cloudflare_record" "hackclubpl_txt_google_spf" {
  zone_id = cloudflare_zone.hackclubpl.id

  name  = "@"
  type  = "TXT"
  value = "v=spf1 include:_spf.google.com ~all"
}

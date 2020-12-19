resource "cloudflare_zone" "hackclubpl" {
  zone = "hackclub.pl"
}

resource "cloudflare_record" "hackclubpl_a_main" {
  zone_id = cloudflare_zone.hackclubpl.id

  name = "@"
  type = "A"
  value = "76.76.21.21"

  proxied = true

  depends_on = [
    cloudflare_zone.hackclubpl
  ]
}

resource "cloudflare_page_rule" "hackclubpl_warsaw_redirect" {
  zone_id = cloudflare_zone.hackclubpl.id
  target = "warsaw.${cloudflare_zone.hackclubpl.zone}/*"

  actions {
    forwarding_url {
      status_code = 307
      url = "https://hackclub.pl"
    }
  }

  depends_on = [
    cloudflare_zone.hackclubpl
  ]
}

# Google Workspace config

resource "cloudflare_record" "hackclubpl_mx_aspmx" {
  zone_id = cloudflare_zone.hackclubpl.id

  name = "@"
  type = "MX"
  value = "aspmx.l.google.com"
  priority = 1

  depends_on = [
    cloudflare_zone.hackclubpl
  ]
}

resource "cloudflare_record" "hackclubpl_mx_aspmx_alt1" {
  zone_id = cloudflare_zone.hackclubpl.id

  name = "@"
  type = "MX"
  value = "alt1.aspmx.l.google.com"
  priority = 5

  depends_on = [
    cloudflare_zone.hackclubpl
  ]
}

resource "cloudflare_record" "hackclubpl_mx_aspmx_alt2" {
  zone_id = cloudflare_zone.hackclubpl.id

  name = "@"
  type = "MX"
  value = "alt2.aspmx.l.google.com"
  priority = 5

  depends_on = [
    cloudflare_zone.hackclubpl
  ]
}

resource "cloudflare_record" "hackclubpl_mx_aspmx_alt3" {
  zone_id = cloudflare_zone.hackclubpl.id

  name = "@"
  type = "MX"
  value = "alt3.aspmx.l.google.com"
  priority = 10

  depends_on = [
    cloudflare_zone.hackclubpl
  ]
}

resource "cloudflare_record" "hackclubpl_mx_aspmx_alt4" {
  zone_id = cloudflare_zone.hackclubpl.id

  name = "@"
  type = "MX"
  value = "alt4.aspmx.l.google.com"
  priority = 10

  depends_on = [
    cloudflare_zone.hackclubpl
  ]
}

resource "cloudflare_record" "hackclubpl_txt_google_spf" {
  zone_id = cloudflare_zone.hackclubpl.id

  name = "@"
  type = "TXT"
  value = "v=spf1 include:_spf.google.com ~all"

  depends_on = [
    cloudflare_zone.hackclubpl
  ]
}

provider "nsxt" {
  host                  = "10.182.3.46"
  username              = "admin"
  password              = "Admin!23Admin"
  allow_unverified_ssl  = true
  max_retries           = 10
  retry_min_delay       = 500
  retry_max_delay       = 5000
  retry_on_status_codes = [429]
}

resource "nsxt_policy_segment" "segment1" {
    connectivity_path   = "/infra/tier-0s/t0"
    display_name        = var.meuportgroup
    transport_zone_path = "/infra/sites/default/enforcement-points/default/transport-zones/1b3a2f36-bfd1-443e-a0f6-4de01abc963e"
    vlan_ids            = []

    advanced_config {
        connectivity = "ON"
        hybrid       = false
        local_egress = false
    }

    subnet {
        cidr        = "172.16.60.1/24"
    }
}


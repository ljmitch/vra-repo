resource "local_file" "key" {
  content = "var.private_key_content"
  filename = "$path.module/key.pem"
} 


provider "oci" { 
  
  depends_on = [
	local_file.key,
  ] 
  
  tenancy_ocid          = var.tenancy_ocid
  user_ocid             = var.user_ocid
  fingerprint           = var.fingerprint
  private_key_path      = "$path.module/key.pem"
  region                = var.region
} 

resource "oci_core_vcn" "vcn1" {
  cidr_block     = "10.0.0.0/16"
  dns_label      = "vcn1"
  compartment_id = var.compartment_ocid
  display_name   = "vcn1"
}



output "vcn_id" {
  value = "$oci_core_vcn.vcn1.id"
}

############################################################################################
# Copyright 2019 Palo Alto Networks.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
############################################################################################

############################################################################################
# CONFIGURE THE PROVIDER AND SET AUTHENTICATION TO GCE API
############################################################################################

provider "google" {
  credentials = file("sa.key")
  project     = var.project
  region      = var.region
}

############################################################################################
# PROCESS EACH MODULE IN ORDER
############################################################################################

module "bootstrap" {
  source  = "stealthllama/panos-bootstrap/google"
  version = "0.9.0"

  bootstrap_project = var.project
  bootstrap_region  = var.region

  hostname = var.fw_name
  # panorama-server = var.panorama
  # tplname         = var.tplname
  # dgname          = var.dgname
  # vm-auth-key     = var.vm_auth_key
}

module "vpc" {
  source = "./modules/vpc"

  vpc_region = var.region

  vpc_mgmt_network_name = "management-network"
  vpc_mgmt_subnet_cidr  = "10.5.0.0/24"
  vpc_mgmt_subnet_name  = "management-subnet"

  vpc_untrust_network_name = "untrust-network"
  vpc_untrust_subnet_cidr  = "10.5.1.0/24"
  vpc_untrust_subnet_name  = "untrust-subnet"

  vpc_trust_network_name = "trust-network"
  vpc_trust_subnet_cidr  = "10.5.2.0/24"
  vpc_trust_subnet_name  = "trust-subnet"

  allowed_mgmt_cidr = var.allowed_mgmt_cidr
}

module "firewall" {
  source = "./modules/firewall"

  fw_name             = var.fw_name
  fw_zone             = var.zone
  fw_image            = "https://www.googleapis.com/compute/v1/projects/paloaltonetworksgcp-public/global/images/vmseries-bundle2-904"
  fw_machine_type     = "n1-standard-4"
  fw_machine_cpu      = "Intel Skylake"
  fw_bootstrap_bucket = module.bootstrap.bootstrap_name

  fw_mgmt_subnet = module.vpc.mgmt_subnet
  fw_mgmt_ip     = "10.5.0.4"
  fw_mgmt_rule   = module.vpc.mgmt-allow-inbound-rule

  fw_untrust_subnet = module.vpc.untrust_subnet
  fw_untrust_ip     = "10.5.1.4"
  fw_untrust_rule   = module.vpc.untrust-allow-inbound-rule

  fw_trust_subnet = module.vpc.trust_subnet
  fw_trust_ip     = "10.5.2.4"
  fw_trust_rule   = module.vpc.trust-allow-outbound-rule
}

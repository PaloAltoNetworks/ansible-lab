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


output "mgmt_network" {
  value = google_compute_network.management-net.self_link
}

output "mgmt_subnet" {
  value = google_compute_subnetwork.management-sub.self_link
}

output "mgmt_subnet_cidr_block" {
  value = google_compute_subnetwork.management-sub.ip_cidr_range
}

output "untrust_network" {
  value = google_compute_network.untrust-net.self_link
}

output "untrust_subnet" {
  value = google_compute_subnetwork.untrust-sub.self_link
}

output "untrust_subnet_cidr_block" {
  value = google_compute_subnetwork.untrust-sub.ip_cidr_range
}

output "trust_network" {
  value = google_compute_network.trust-net.self_link
}

output "trust_subnet" {
  value = google_compute_subnetwork.trust-sub.self_link
}

output "trust_subnet_cidr_block" {
  value = google_compute_subnetwork.trust-sub.ip_cidr_range
}

output "mgmt-allow-inbound-rule" {
  value = google_compute_firewall.mgmt-allow-inbound.self_link
}

output "untrust-allow-inbound-rule" {
  value = google_compute_firewall.untrust-allow-inbound.self_link
}

output "trust-allow-outbound-rule" {
  value = google_compute_firewall.trust-allow-outbound.self_link
}

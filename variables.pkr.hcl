########################################################################
# Server Connection Details
########################################################################
variable "vsphere_server" {
}
variable "vsphere_username" {
}
variable "vsphere_password" {
}
variable "vsphere_insecure_connection" {
}
variable "vm_communicator"{
}
########################################################################
# WinRM Connection Details
########################################################################
variable "winrm_connection_username" {
}
variable "winrm_connection_password" {
}
variable "winrm_connection_timeout" {
}
########################################################################
# SSH Connection Details
########################################################################
variable "ssh_username" {
}
variable "ssh_password" {
}
variable "ssh_timeout" {
}
variable "ssh_handshake_attempts" {
}
########################################################################
# Image Build Location Details
########################################################################
variable "vsphere_datacenter" {
}
variable "vsphere_cluster" {
}
variable "vsphere_datastore" {
}
variable "vsphere_folder" {
}
variable "vsphere_convert_to_template" {
}
variable "vsphere_library" {
}
variable "is_ovf" {
}
variable "destroy" {
}
########################################################################
# Image Information
########################################################################
# Disk Information
variable "disk_size" {
}
variable "disk_type" {
}
variable "disk_thin_provisioned" {
}
# Network Information
variable "vm_network" { 
}
variable "nic_type" {
}
# Hardware Information
variable "num_cpu" {
}
variable "cpu_hot_add" {
}
variable "num_cores" {
}
variable "vm_ram" {
}
variable "ram_hot_add" {
}
# OS Information
variable "guest_os_type" {
}
variable "os_family" {
}
variable "os_flavor" {
}
variable "os_version" {
}
# Files
variable "cd_files" {
}
variable "floppy_files" {
}
variable "os_iso_paths" {
}
variable "iso_checksum" {
}
# Other
variable "boot_type" {
}
variable "boot_wait" {
}
variable "domain_name" {
}
variable "ip_wait_timeout" {
}
variable "boot_command" {
}
variable "http_directory" {
}
########################################################################
# Build Information
########################################################################
variable "build_scripts" {
}





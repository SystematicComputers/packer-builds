########################################################################
# Server Connection Details
########################################################################
vsphere_insecure_connection = true
########################################################################
# WINRM Connection Details
########################################################################
winrm_connection_timeout = "1h"
########################################################################
# SSH Connection Details
########################################################################
ssh_timeout = "1h"
ssh_handshake_attempts = 100
########################################################################
# Image Build Location Details
########################################################################
vsphere_convert_to_template = false
is_ovf = true
destroy = true
########################################################################
# Image Information
########################################################################
# Disk Information
disk_size = 32000
disk_type = "lsilogic-sas"
disk_thin_provisioned = true
# Network Information
nic_type = "vmxnet3"
# Hardware Information
num_cpu = 2
num_cores = 1
cpu_hot_add = true
vm_ram = 2048
ram_hot_add = true
# Files
cd_files=[]
iso_checksum=""
# Other
boot_type="bios"
boot_wait="2m"
domain_name = "repo.local"
ip_wait_timeout="1h"
http_directory=""
boot_command=[]
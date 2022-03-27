vm_communicator = "ssh"
########################################################################
# Image Information
########################################################################
# Disk Information
disk_size = 32000
# Network Information
vm_network = "vm network"

# Files
os_iso_paths = ["[datastore] os/linux/ubuntu/18/ubuntu-18.04.6-live-server-amd64.iso"]
floppy_files =["boot/linux/ubuntu/18/ubuntu.cfg"]
http_directory="boot/linux/ubuntu/18/"
#Other
ip_wait_timeout = "10m"
boot_wait="3s"
boot_command = [
    "<enter><enter><f6><esc><wait> ",
    "autoinstall ds=nocloud-net;seedfrom=http://{{ .HTTPIP }}:{{ .HTTPPort }}/",
    "<enter><wait>"
]

########################################################################
# Build Information
########################################################################
build_scripts = [
          "scripts/linux/ubuntu/proxy.sh",
          "scripts/linux/ubuntu/upgrade.sh",
          "scripts/linux/ubuntu/install.sh",
          "scripts/linux/ubuntu/accounts.sh"
      ]
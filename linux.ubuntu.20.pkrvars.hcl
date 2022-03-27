vm_communicator = "ssh"
########################################################################
# Image Information
########################################################################
# Disk Information
disk_size = 32000
# Network Information
vm_network = "vm network"
# Files
os_iso_paths = ["[datastore] os/linux/ubuntu/20/ubuntu-20.04.3-live-server-amd64.iso"]
floppy_files =[]
http_directory="boot/linux/ubuntu/20/"
#Other
ip_wait_timeout = "10m"
boot_wait="5s"
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
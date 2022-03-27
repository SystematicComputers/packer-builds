vm_communicator = "ssh"
########################################################################
# Image Information
########################################################################
# Disk Information
disk_size = 32000
# Network Information
vm_network = "vm network"
# Files
os_iso_paths = ["[datastore] os/linux/ubuntu/21/ubuntu-21.10-live-server-amd64.iso"]
floppy_files =[]
http_directory="boot/linux/ubuntu/21/"
#Other
boot_wait="3s"
boot_command = [
        "<esc><esc><esc><esc>e<wait>",
        "<del><del><del><del><del><del><del><del>",
        "<del><del><del><del><del><del><del><del>",
        "<del><del><del><del><del><del><del><del>",
        "<del><del><del><del><del><del><del><del>",
        "<del><del><del><del><del><del><del><del>",
        "<del><del><del><del><del><del><del><del>",
        "<del><del><del><del><del><del><del><del>",
        "<del><del><del><del><del><del><del><del>",
        "<del><del><del><del><del><del><del><del>",
        "<del><del><del><del><del><del><del><del>",
        "<del><del><del><del><del><del><del><del>",
        "<del><del><del><del><del><del><del><del>",
        "<del><del><del><del><del><del><del><del>",
        "<del><del><del><del><del><del><del><del>",
        "linux /casper/vmlinuz --- autoinstall ds=\"nocloud-net;seedfrom=http://{{.HTTPIP}}:{{.HTTPPort}}/\"<enter><wait>",
        "initrd /casper/initrd<enter><wait>",
        "boot<enter>",
        "<enter><f10><wait>"
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
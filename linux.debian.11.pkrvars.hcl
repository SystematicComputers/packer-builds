vm_communicator = "ssh"
########################################################################
# Image Information
########################################################################
# Disk Information
disk_size = 32000
# Network Information
vm_network = "vm network"

# Files
os_iso_paths = ["[datastore] os/linux/debian/11/debian-11.1.0-amd64-netinst.iso"]
floppy_files =[]
http_directory="boot/linux/debian/11/"
#Other
boot_wait="10s"
boot_command = [
  "<esc><wait>",
  "install ",
  " preseed/url=http://{{ .HTTPIP }}:{{ .HTTPPort }}/debian.cfg <wait>",
  "debian-installer=en_AU auto=true locale=en_AU kbd-chooser/method=us ",
  "netcfg/get_hostname=pkrdebian11 ",
  "fb=false debconf/frontend=noninteractive ",
  "console-setup/ask_detect=false console-keymaps-at/keymap=us ",
  "keyboard-configuration/xkb-keymap=us ",
  "<enter>"
]

########################################################################
# Build Information
########################################################################
build_scripts = [
          "scripts/linux/debian/proxy.sh",
          "scripts/linux/debian/upgrade.sh",
          "scripts/linux/debian/install.sh",
          "scripts/linux/debian/accounts.sh"
      ]
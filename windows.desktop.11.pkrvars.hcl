vm_communicator = "winrm"
########################################################################
# Image Information
########################################################################
# Disk Information
disk_size = 60000
vm_ram = 8192
# Network Information
vm_network = "vm network"
# Files
os_iso_paths = ["[datastore] os/windows/desktop/11/Windows-11-disabled-tpm.iso", "[] /usr/lib/vmware/isoimages/windows.iso"]
floppy_files =[
      "./boot/windows/desktop/11/autounattend.xml",
      "./scripts/windows/desktop/11/setup.ps1",
      "./scripts/windows/vmtools.cmd"
  ]
boot_type = "efi-secure"

#Other
boot_command = [
        "<leftShiftOn><f10><leftShiftOff><wait>",
        "reg add HKLM\\SYSTEM\\Setup\\LabConfig /t REG_DWORD /v BypassTPMCheck /d 1<return>",
        "reg add HKLM\\SYSTEM\\Setup\\LabConfig /t REG_DWORD /v BypassSecureBootCheck /d 1<return><wait>",
        "exit<return>",
        "<wait><return>"
]

########################################################################
# Build Information
########################################################################
build_scripts = [
          "scripts/windows/remove-update-cache.ps1",
          "scripts/windows/reset-empty-space.ps1"
      ]
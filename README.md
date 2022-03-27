# Packer

## Powered by

- [Packer](https://www.packer.io/docs)
- [vSphere](https://docs.vmware.com/en/VMware-vSphere/index.html)
- [Azure DevOps](https://azure.microsoft.com/en-au/services/devops/)

## Introduction

The home of all things for [Packer](https://www.packer.io/docs).

This repo contains packer scripts using HCL language to create vmware ovf files. Files were based off [packer-vsphere-hcl](https://github.com/tvories/packer-vsphere-hcl) git repo by [Taylor Vories](https://github.com/tvories)

## Operating Systems
- Debian
  - 11
- Ubuntu
  - 18
  - 20
  - 21
- Windows
  - Desktop
    - 11

## Usage

The `vsphere.pkr.hcl` file is the main packer configuration file that contains all the builder and processor functions to build each type of OS. Run out of the packer folder.
You can build an image manually using the below command ([var_init.sh](./var_init.sh)) otherwise the pipeline files can be used in [Azure DevOps](https://azure.microsoft.com/en-au/services/devops/) CI/CD. 

``` bash
read os_family
read os_flavor
read os_version
read vsphere_server
read vsphere_username
read -s vsphere_password
read ssh_username
read ssh_password
read winrm_connection_username
read winrm_connection_password
read guest_os_type
read vsphere_datacenter
read vsphere_cluster
read vsphere_datastore
read vsphere_folder
read vsphere_library

packer build \
--only vsphere-iso.$os_family \
--var-file=$os_family.$os_flavor.$os_version.pkrvars.hcl \
--var="vsphere_server=$vsphere_server " \
--var="vsphere_username=$vsphere_username " \
--var="vsphere_password=$vsphere_password " \
--var="ssh_username=$ssh_username " \
--var="ssh_password=$ssh_password " \
--var="winrm_connection_username=$winrm_connection_username " \
--var="winrm_connection_password=$winrm_connection_password " \
--var="os_family=$os_family " \
--var="os_flavor=$os_flavor " \
--var="os_version=$os_version " \
--var="guest_os_type=$guest_os_type " \
--var="vsphere_datacenter=$vsphere_datacenter " \
--var="vsphere_cluster=$vsphere_cluster " \
--var="vsphere_datastore=$vsphere_datastore " \
--var="vsphere_folder=$vsphere_folder " \
--var="vsphere_library=$vsphere_library " \
-timestamp-ui \
-on-error=abort \
-force .
```

## Information

You can target specific builds with the `--only` parameter.

Each OS family has its own `source` and `builder` block in the `vsphere.pkr.hcl` file.  Each specific OS version has its own variable file that contains the unique variables for the os. This means that you can build Debian 11 from the same `builder` block as another flavor.

Note the trailing `.` at the end of the command.  That is telling packer to build everything in the current directory.  This is key for any `auto.pkrvars.hcl` to be automatically populated.

## Directory Structure

``` text
packer
├── boot
|   └── linux
|   |    └── debian
|   |    └── ubuntu
|   └── Windows
|       └── desktop
├── drivers
|   └── vmware
├── pipeline
└── scripts
    └── linux
    |   └── debian
    |   └── ubuntu
    └── windows
        └── desktop
                
```

`boot` - Stores kickstart, answerfiles, and preseed files. These are named as to be targeted by the packer variables `os_family` and `os_flavor` and `os_version`.  This is so you can dynamically pick the correct `boot` files.

`drivers` - VMware Tools drivers for Windows pvscsi driver and VMXNET3 driver.  This allows Windows to come up with storage and network without needing to have VMware Tools installed.

`pipeline` - Contains azure pipeline yaml files for pipeline creation in azure devops.

`scripts` - Scripts used for bootstrapping the OSes. Os Version specific scripts can go in their respective version folders.

`root directory` - Where the actual packer files exist.

## Key items

### `vsphere.pkr.hcl`

This is where the sources and builds are defined.  Every build is triggered from this file.  It includes Ubuntu, Centos, and Windows sources and builds.

### `vsphere.auto.pkrvars.hcl`

These are variables that are loaded automatically (anything with a `.auto.pkrvars.hcl` will load automatically in the same directory) and are the same for every build.  This is where the vsphere variables are populated.

### `variables.pkr.hcl`

This is where the hcl variables are declared.  You could potentially put this at the top of your `vsphere.pkr.hcl` file, but it's good practice to keep your variables files separate.

There are some defaults defined in this file, but for the most part variables are declared in the individual OS variable files.

## Individual OS variable files

These files are specifically provided during the packer command to tell packer which build to process.  An example packer command would be: `packer build -force --only vsphere-iso.linux --var-file=linux.ubuntu.21.pkrvars.hcl .`

Note the trailing period in that command.  That is telling packer to build everything in the directory, which is required to get the `auto.pkrvars.hcl` to work correctly.  Note in that command the `--only` flag.  That tells packer to only build the `vsphere-iso.linux.ubuntu.21` source.

## Azure Pipelines CI/CD

[Azure DevOps](https://azure.microsoft.com/en-au/services/devops/)

There are active pipelines running at [link](https://azure.microsoft.com/en-au/services/devops/).
There is a pipeline per OS build.
Each pipeline has the following variables

``` text
variables:
  - group: "(vcenter)"
  - group: "pkr_svc_acc"
  - group: "packer_auto_variables"
  - group: "(os_flavor)_(os_family)_(os_version)"
  - group: "ccc"
```

Under [Library](https://azure.microsoft.com/en-au/services/devops/) create variable groups per os build name (os_flavor)*(os_family)*(os_version)

There is also a requirement for the following credential variable groups for winrm and ssh access. Use one of these according to the connection required. EG: winrm for windows device.

- ssh_details *SSH details for Debian & Ubuntu builds*
- winrm_details *WinRM details for windows os builds*

Below is info on the other variable groups in the library

- vcenter *contains variables for the vcenter server that the builds are being deployed to.*
- pkr_svc_acc *contains variables for the service account packer uses to perform the build operations.*
- packer_auto_variables *contains variables specific for packer*

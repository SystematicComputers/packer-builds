#bash to init variables for terraform run
echo "input os build family"
read osfamily
export os_family=$osfamily

echo "input os build flavor"
read osflavor
export os_flavor=$osflavor

echo "input os build version"
read osversion
export os_version=$osversion

echo "input vsphere server"
read vserver
export vsphere_server=$vserver

echo "input vsphere username"
read vuser
export vsphere_username=$vuser

echo "input vsphere password"
read -s vpass
export vsphere_password=$vpass

echo "input windows admin username"
read winusername
export winrm_connection_username=$winusername

echo "input windows admin password"
read -s winpass
export winrm_connection_password=$winpass

echo "input linux username"
read linuxusername
export ssh_username=$linuxusername

echo "input windows admin password"
read -s linuxpass
export ssh_password=$linuxpass

echo "input vsphere guest os type"
read guestos
export guest_os_type=$guestos

echo "input vsphere datacenter"
read vdatacenter
export vsphere_datacenter=$vdatacenter

echo "input vsphere cluster"
read vcluster
export vsphere_cluster=$vcluster

echo "input vsphere datastore"
read vdatastore
export vsphere_datastore=$vdatastore

echo "input vsphere folder"
read vfolder
export vsphere_folder=$vfolder

echo "input vsphere library"
read vlibrary
export vsphere_library=$vlibrary



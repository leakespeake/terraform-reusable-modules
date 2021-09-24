# Ubuntu Server Deployment

This source module is designed to clone and deploy VMs from a **Ubuntu Server 20.04.2 LTS** Packer template. It provides a consistent and repeatable way to deploy Ubuntu Server VMs on, in this case, a nested vSphere 7 homelab. It uses the **vsphere** Terraform provider to deploy the cloned VMs within a vSphere 7 vCenter server. 

It also uses the Hashicorp DNS provider to create A records on Windows DNS (AD server) for each VM. The configuration of this provider means that the setting for the forward lookup zone in Windows DNS must be set to: **Dynamic updates set to: Nonsecure and secure** then manually set back to the default of **Secure only** once the terraform apply operation completes. 

The original Packer template creation can be referenced at; https://github.com/leakespeake/packer/tree/master/builders/vmware/vsphere-iso/ubuntu-server-20-04

## Versions

- Terraform --> 1.0.6
- vSphere provider --> 2.0.2
- Hashicorp DNS provider --> 3.2.1
- vSphere vCenter --> 7.0.2

## Use Case

All resource arguments are configured using the DRY principle.

This child module has been validated by populating default values for each variable then using the following to confirm the code;

```
terraform validate
terraform plan
```

We can create a root (parent) module within https://github.com/leakespeake/terraform-projects/tree/master/modules/vsphere to explicitly pass in any input variable values we wish to overwrite - as well as calling any resource attributes that have been exposed via outputs.

Whilst building out the parent module it may be easier to set the **source** path to the locally cloned copy of this repo (-rather than GitHub) - this way, changes to both parent (root) and child (source) are effective immediately (whilst any issues are ironed out) - we can then commit them post deployment. Example below;

```
module "my-parent-module" {
  source = "C:\Users\username\Documents\github-leakespeake\terraform-reusable-modules\vsphere\template-cloning\linux\ubuntu-server-20-04"
```
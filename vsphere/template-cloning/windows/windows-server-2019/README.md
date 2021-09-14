# Windows Server Deployment

This source module is designed to clone and deploy VMs from a **Windows Server 2019** Packer template. 

It uses the **vsphere** Terraform provider to deploy within vSphere 6.5 and above. All resource arguments are configured using the DRY principle.

The original Packer template creation can be referenced at; https://github.com/leakespeake/packer/tree/master/builders/vmware/vsphere-iso/windows-server-2019

## Versions

- Terraform --> 0.14.7
- vSphere provider --> 1.24.3
- vSphere vCenter --> 6.7

## Use Case

This source module has been validated by populating default values for each variable then using the following to confirm the code;

```
terraform validate
terraform plan
```

We can create a root module within https://github.com/leakespeake/terraform-projects/tree/master/modules/vsphere to pass in any variable values we wish to overwrite such as the IP configuration.

Whilst building out the root module it may be easier to set the **source** path to the locally cloned copy of this repo (rather than GitHub) - this way, changes to both root and source are effective immediately (whilst any issues are ironed out) - we can then commit them post deployment. Example below;

```
source = "C:\Users\username\Documents\github-leakespeake\terraform-reusable-modules\vsphere\template-cloning\windows"
```
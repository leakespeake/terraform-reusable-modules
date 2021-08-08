![tf](https://user-images.githubusercontent.com/45919758/85199881-af381100-b2ea-11ea-96b2-cdf29fd0b712.png)
# terraform-reusable-modules
Child modules for Terraform deployments in AWS, GCP and vSphere home lab. Consumed by calling modules across stage and production in the **terraform-projects** repository.

This repo uses tags that reflect the version of Terraform that it is currently compatible for. These tags can be used as the source ref in the **terraform-projects** calling / root modules. 

After each major Terraform release, this source module code is tested, modified and then tagged as per example below;

```
git tag -a "v.0.14.2" -m "Terraform version 0.14.2 compatible"

git push --follow-tags
```
Deployments in the **terraform-projects** repo, whether stage or production, have an immediate visual reference to the Terraform version they were written for at the last commit.

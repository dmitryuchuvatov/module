# Sample repo that can be used as Module

More information about modules is [here](https://www.terraform.io/docs/language/modules/sources.html)


# Prerequisites

Install and configure Terraform as per [official documentation](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

# How To

## Create a Terraform file that will use this repo as Module

```
module "mymodule" {
  source = "github.com/dmitryuchuvatov/module/mymodule"
}
```

## Initialize Terraform

```
terraform init
```

You should see the similar output:

```
Initializing the backend...
Upgrading modules...
Downloading git::https://github.com/dmitryuchuvatov/module.git for mymodule...
- mymodule in .terraform/modules/mymodule/mymodule

Initializing provider plugins...
- Finding hashicorp/null versions matching "3.2.1"...
- Using previously-installed hashicorp/null v3.2.1

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
```

## Run Terraform Apply

```
terraform apply
```
When prompted, enter **yes** hit **Enter** to confirm:

```
Terraform used the selected providers to generate the following execution plan. Resource actions are indicated
with the following symbols:
  + create

Terraform will perform the following actions:

  # module.mymodule.null_resource.null will be created
  + resource "null_resource" "null" {
      + id = (known after apply)
    }

Plan: 1 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

module.mymodule.null_resource.null: Creating...
module.mymodule.null_resource.null: Creation complete after 0s [id=6201290367874087293]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
```


## Clean up

```
terraform destroy
```

When prompted, enter **yes** hit **Enter** to confirm:

```
module.mymodule.null_resource.null: Refreshing state... [id=6201290367874087293]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated
with the following symbols:
  - destroy

Terraform will perform the following actions:

  # module.mymodule.null_resource.null will be destroyed
  - resource "null_resource" "null" {
      - id = "6201290367874087293" -> null
    }

Plan: 0 to add, 0 to change, 1 to destroy.

Do you really want to destroy all resources?
  Terraform will destroy all your managed infrastructure, as shown above.
  There is no undo. Only 'yes' will be accepted to confirm.

  Enter a value: yes

module.mymodule.null_resource.null: Destroying... [id=6201290367874087293]
module.mymodule.null_resource.null: Destruction complete after 0s

Destroy complete! Resources: 1 destroyed.
```

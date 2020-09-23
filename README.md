# BeeGFS Cloud Deployment

## AWS

### Requirements

* Packer
* Terraform
* Ansible
* Python
* aws CLI

### Install Packer Ansible Terraform

Packer:

[Installation Guide Packer](https://learn.hashicorp.com/tutorials/packer/getting-started-install#precompiled-binaries)

Terraform:

[Installation Guide Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli)

Ansible:
```
python -m -venv venv
source venv/bin/activate
pip install ansible
```

### Setup AWS CLI
To configure your aws cli insert two profiles and a credential entry to aws configs in ~/.aws

create 2 new roles in ~/.aws/config 
```
[profile xyz]

[profile produser]
role_arn = <role>
source_profile = default
region = us-west-2
output = json
```

create 1 credential entry in ~/.aws/credentials

```
[xyz]
aws_access_key_id =  <insert secret access key id>
aws_secret_access_key =  <insert secret access key>
```
### Build the AWS AMI

Run packer with a Makefile command

```
make AWS-packer-build
``` 

### Init Terraform

Run terraform plan to validate the script and see the changes terraform intends to perform

```
make AWS-terraform-init
``` 

### Apply Terraform

Run terraform apply to setup the infrastructure with AWS, this command is going to prompt you. Type ```yes``` to actually deploy the VMs
```
make AWS-terraform-apply
```

### Using preconfigured SSH via Hostfile template

To use the generated ssh-config file you have to either 
1) use the connect make command 
2) move the config file to the specific location ```~/.ssh/config```

Connect to the Pointcloud-Tiler Instance:

```
make AWS-connect
```

or use the following command to move the file and **overwrite** the old ssh-config:

```
move-ssh-config-to-ssh-directory
```

### Provision the running ec2 instance

```
make AWS-provisioning
```

for a more verbose provisioning use:

```
make AWS-provisioning-verbose
```

### Additional Information

The .pem file needs to have a specific permission. AWS is going to complain if the file doesn't meet the required permission.
```
chmod 400 <name of keypair pem file>.pem
```

include .env
export $(shell sed 's/=.*//' .env)
sshAWS:= ssh -F AWS/terraform/ssh_config




########
# AWS Commands
########
AWS-terraform-init:
	cd AWS/terraform && terraform init && cd ..

AWS-terraform-plan:
	cd AWS/terraform && \
	terraform plan && \
	cd ..

AWS-terraform-apply:
	cd AWS/terraform && \
	terraform apply && \
	cd ..

AWS-terraform-destroy:
	cd AWS/terraform && \
	terraform destroy && \
	cd ..

AWS-packer-build:
	cd AWS/packer && \
	packer build template.json && \
	cd ..

AWS-provisioning:
	cd AWS/ansible && \
	ansible-playbook -i ../terraform/ansible-provisioning/aws-hosts site.yml && \
	cd ..

provisioning-verbose:
	cd AWS/ansible && \
	ansible-playbook -vvvv -i ../terraform/ansible-provisioning/aws-hosts site.yml && \
	cd ..

AWS-connect-managment:
	$(sshAWS) beeGFS_managment

AWS-connect-metadata:
	$(sshAWS) beeGFS_metadata

AWS-connect-storage:
	$(sshAWS) beeGFS_storage	

AWS-move-ssh-config-to-ssh-directory:
	cd AWS/terraform && \
	mv ssh_config ~/.ssh/config && \
	cd ..

	
## printing env vars
## format: 
## make print-<Variable Name>
print-%  : ; @echo $* = $($*)

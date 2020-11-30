################################################
#  AWS Terraform For BeeGFS         
#  by Simon Stockhause 
################################################

# Create A File Which Contains The Created Hosts From AWS
# Contains:
#  - 
# data  "template_file" "aws" {
#     template = "${file("./templates/hosts.tpl")}"
#     vars = {
#         ansible_ssh_private_key_file= "${var.ssh_private_key_file_path}"
#         beeGFS_managment = aws_instance.beeGFS-management.public_dns
#         beeGFS_metadata = aws_instance.beeGFS-metadata.public_dns
#         beeGFS_storage = aws_instance.beeGFS-storage.public_dns
#         beeGFS_client_1 = aws_instance.beeGFS-client-1.public_dns
#         beeGFS_client_2 = aws_instance.beeGFS-client-2.public_dns
#         beeGFS_client_3 = aws_instance.beeGFS-client-3.public_dns

#     }
# }

resource "local_file" "aws_file" {
  content  = templatefile(
    "./templates/hosts.tpl",
    {
      ansible_ssh_private_key_file= "${var.ssh_private_key_file_path}"

      beeGFS_managment = aws_instance.beeGFS-management.public_dns,

      beeGFS_metadatas = module.beeGFS_metadata_cluster.public_dns,
      beeGFS_storages = module.beeGFS_storage_cluster.public_dns,
      beeGFS_clients = module.beeGFS_client_cluster.public_dns,
    }
  )
  filename = "./ansible-provisioning/aws-hosts"
}


################################################
#  AWS SSH Config File creattion via template        
#  by Simon Stockhause 
################################################

# Create A File Which Contains The Necessary SSH Configurations
# To Access AWS Machines From A Remote Machine
# data  "template_file" "ssh" {
#     template = "${file("./templates/ssh_config.tpl")}"
#     vars = {
#         beeGFS_managment = aws_instance.beeGFS-management.public_dns
#         beeGFS_metadata = aws_instance.beeGFS-metadata.public_dns 
#         beeGFS_storage = aws_instance.beeGFS-storage.public_dns
#         ssh_key = "${var.ssh_private_key_file_path}"
#         ssh_username = "ubuntu"

#     }
# }

resource "local_file" "ssh_file" {
  content  = templatefile(
    "./templates/ssh_config.tpl",
    {
      ssh_key = "${var.ssh_private_key_file_path}",
      ssh_username = "ubuntu",

      beeGFS_managment = aws_instance.beeGFS-management.public_dns,

      beeGFS_metadatas = module.beeGFS_metadata_cluster.public_dns
      beeGFS_storages = module.beeGFS_storage_cluster.public_dns,
      beeGFS_clients = module.beeGFS_client_cluster.public_dns,
    }
  )
  filename = "./ssh_config"
}

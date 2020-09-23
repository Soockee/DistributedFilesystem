################################################
#  AWS SSH Config File creattion via template        
#  by Simon Stockhause 
################################################

# Create A File Which Contains The Necessary SSH Configurations
# To Access AWS Machines From A Remote Machine
data  "template_file" "ssh" {
    template = "${file("./templates/ssh_config.tpl")}"
    vars = {
        beeGFS_managment = aws_instance.beeGFS-managment.public_dns
        beeGFS_metadata = aws_instance.beeGFS-metadata.public_dns 
        beeGFS_storage = aws_instance.beeGFS-storage.public_dns
        beeGFS_client = aws_instance.beeGFS-client.public_dns

        ssh_key = "${var.ssh_private_key_file_path}"
        ssh_username = "ubuntu"
    }
}

resource "local_file" "ssh_file" {
  content  = "${data.template_file.ssh.rendered}"
  filename = "./ssh_config"
}

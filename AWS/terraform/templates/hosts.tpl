[all:vars]
ansible_user=ubuntu
ansible_become=yes
ansible_ssh_private_key_file=${ ansible_ssh_private_key_file }
ansible_python_interpreter=/usr/bin/python3

[beeGFS_managment]
${ beeGFS_managment }

[beeGFS_metadata]
${ beeGFS_metadata }

[beeGFS_storage]
${ beeGFS_storage }

[beeGFS_client]
${ beeGFS_client }
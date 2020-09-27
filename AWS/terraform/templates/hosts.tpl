[all]
${ beeGFS_managment }

%{for beeGFS_metadata_addr in beeGFS_metadatas ~}
${ beeGFS_metadata_addr }
%{ endfor ~}

%{for beeGFS_storage in beeGFS_storages ~}
${ beeGFS_storage }
%{ endfor ~}

%{for beeGFS_client in beeGFS_clients ~}
${ beeGFS_client }
%{ endfor ~}

[all:vars]
ansible_user=ubuntu
ansible_become=yes
ansible_ssh_private_key_file=${ ansible_ssh_private_key_file }
ansible_python_interpreter=/usr/bin/python3

beeGFS_managment_ipv4=${ beeGFS_managment }

[beeGFS_managment]
${ beeGFS_managment }

[beeGFS_metadata]
%{for beeGFS_metadata_addr in beeGFS_metadatas ~}
${ beeGFS_metadata_addr }
%{ endfor ~}

[beeGFS_storage]
%{for beeGFS_storage in beeGFS_storages ~}
${ beeGFS_storage }
%{ endfor ~}

[beeGFS_client]
%{for beeGFS_client in beeGFS_clients ~}
${ beeGFS_client }
%{ endfor ~}
Host *
	SendEnv LANG LC_*
  StrictHostKeyChecking no
  User ubuntu
  IdentityFile ${ ssh_key }

Host beeGFS_managment
  HostName ${ beeGFS_managment }
  ControlMaster auto
  ControlPath ~/.ssh/ansible-%r@%h:%p
  ControlPersist 5m
  ForwardAgent yes
  ForwardX11 yes

%{for index, beeGFS_metadata_addr in beeGFS_metadatas ~}
Host beeGFS_metadata_${index}
  HostName ${ beeGFS_metadata_addr }
  ControlMaster auto
  ControlPath ~/.ssh/ansible-%r@%h:%p
  ControlPersist 5m
  ForwardAgent yes
  ForwardX11 yes
%{ endfor ~}

%{for index, beeGFS_storage_addr in beeGFS_storages ~}
Host beeGFS_storage_${index}
  HostName ${ beeGFS_storage_addr }
  ControlMaster auto
  ControlPath ~/.ssh/ansible-%r@%h:%p
  ControlPersist 5m
  ForwardAgent yes
  ForwardX11 yes
%{ endfor ~}

%{for index, beeGFS_client_addr in beeGFS_clients ~}
Host beeGFS_client_${index}
  HostName ${ beeGFS_client_addr }
  ControlMaster auto
  ControlPath ~/.ssh/ansible-%r@%h:%p
  ControlPersist 5m
  ForwardAgent yes
  ForwardX11 yes
%{ endfor ~}
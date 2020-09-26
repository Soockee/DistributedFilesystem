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

Host beeGFS_metadata
  HostName ${ beeGFS_metadata }
  ControlMaster auto
  ControlPath ~/.ssh/ansible-%r@%h:%p
  ControlPersist 5m
  ForwardAgent yes
  ForwardX11 yes

Host beeGFS_storage
  HostName ${ beeGFS_storage }
  ControlMaster auto
  ControlPath ~/.ssh/ansible-%r@%h:%p
  ControlPersist 5m
  ForwardAgent yes
  ForwardX11 yes

Host beeGFS_client_1
  HostName ${ beeGFS_client_1 }
  ControlMaster auto
  ControlPath ~/.ssh/ansible-%r@%h:%p
  ControlPersist 5m
  ForwardAgent yes
  ForwardX11 yes

Host beeGFS_client_2
  HostName ${ beeGFS_client_2 }
  ControlMaster auto
  ControlPath ~/.ssh/ansible-%r@%h:%p
  ControlPersist 5m
  ForwardAgent yes
  ForwardX11 yes

Host beeGFS_client_3
  HostName ${ beeGFS_client_3 }
  ControlMaster auto
  ControlPath ~/.ssh/ansible-%r@%h:%p
  ControlPersist 5m
  ForwardAgent yes
  ForwardX11 yes
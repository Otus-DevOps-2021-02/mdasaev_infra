# mdasaev_infra
mdasaev Infra repository

#1 Cloudtestapp HW details:
**Automating app deployment on instance creation**

***testapp_IP = 130.193.38.140***
***testapp_port = 9292***

#2 **cloud-config.yaml** - cloud-init скрипт для запуска скриптов на созданном инстансе. Этот скрипт передается в метаданных при создании инстанса в ус. Скрипты для приложения клонируются из репо.
#2 **yc-instance-init** - используется для создания yc инстанса, в который передается **cloud-config.yaml**

```

#!/bin/bash

yc compute instance create \
  --name reddit-app \
  --hostname reddit-app \
  --memory=4 \
  --create-boot-disk image-folder-id=standard-images,image-family=ubuntu-1604-lts,size=10GB \
  --network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 \
  --metadata serial-port-enable=1 \
  --ssh-key ~/.ssh/appuser.pub\
  --metadata-from-file user-data=cloud-config.yaml

  ```

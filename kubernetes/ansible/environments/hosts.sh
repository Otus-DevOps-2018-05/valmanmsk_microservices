#!/bin/bash

EXTERNAL_IP_0=`gcloud --format="value(networkInterfaces[0].accessConfigs[0].natIP)" compute instances list --filter="name:controller-0"`
EXTERNAL_IP_1=`gcloud --format="value(networkInterfaces[0].accessConfigs[0].natIP)" compute instances list --filter="name:controller-1"`
EXTERNAL_IP_2=`gcloud --format="value(networkInterfaces[0].accessConfigs[0].natIP)" compute instances list --filter="name:controller-2"`
INTERNAL_IP_0=`gcloud --format="value(networkInterfaces[0].networkIP)" compute instances list --filter="name:controller-0"`
INTERNAL_IP_1=`gcloud --format="value(networkInterfaces[0].networkIP)" compute instances list --filter="name:controller-1"`
INTERNAL_IP_2=`gcloud --format="value(networkInterfaces[0].networkIP)" compute instances list --filter="name:controller-2"`
echo "{
    \"controllers\": {
        \"hosts\": [\"$EXTERNAL_IP_0\", \"$EXTERNAL_IP_1\", \"$EXTERNAL_IP_2\"]
    },
    \"_meta\": {
          \"hostvars\": {
              \"$EXTERNAL_IP_0\": {
                  \"ETCD_NAME\": \"controller-0\",
                  \"INTERNAL_IP\": \"$INTERNAL_IP_0\"
            },
              \"$EXTERNAL_IP_1\": {
                  \"ETCD_NAME\": \"controller-1\",
                  \"INTERNAL_IP\": \"$INTERNAL_IP_1\"
            },
              \"$EXTERNAL_IP_2\": {
                  \"ETCD_NAME\": \"controller-2\",
                  \"INTERNAL_IP\": \"$INTERNAL_IP_2\"
            }
        }
    }
}
" > environments/hosts.json
if [ "$1" == "--list" ];
then
   cat environments/hosts.json
else
    echo ""
fi


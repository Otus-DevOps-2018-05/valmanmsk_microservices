#!/bin/bash
SCRIPT_PATH=`pwd`
cd $SCIPT_PATH../terraform
app_ip=$(terraform output app_external_ip)
cd $SCIPT_PATH 
echo "{
    \"docker-hosts\": {
        \"hosts\": [\"$app_ip\"]
    }
}
" > $SCRIPT_PATH/inventory.json
if [ "$1" == "--list" ];
then
    cat $SCRIPT_PATH/inventory.json
else
    echo ""
fi


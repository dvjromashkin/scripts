#!/bin/bash
source .bash_profile
source .profile
source .bashrc
STATE1=$(curl --location --request POST http://127.0.0.1:9000/ --header 'Content-Type: application/json' --data-raw '{ "jsonrpc":"2.0", "method":"sui_getTotalTransactionBlocks","id":1}' | jq | grep result | awk '{print $2}' | tr -d '",')
sleep 60
STATE2=$(curl --location --request POST http://127.0.0.1:9000/ --header 'Content-Type: application/json' --data-raw '{ "jsonrpc":"2.0", "method":"sui_getTotalTransactionBlocks","id":1}' | jq | grep result | awk '{print $2}' | tr -d '",')
RESULT=$(( $STATE2 - $STATE1 ))
if (( $RESULT > 0 ));
then
        echo -e "Transaction upper\n"
        echo "Trans 1 =" $SOHRAN " Trans 2 =" $SOHRAN2 " Difference=" $RESULT
else
TELEGRAM_BOT_TOKEN="12345678901234:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
CHAT_ID="123456789"

SUMMARY=$(echo SUI: NO TRANSACTION!!! )

curl -X POST \
     -H "Content-Type: application/json" \
     -d "{\"chat_id\": \"${CHAT_ID}\", \"text\": \"${SUMMARY}\", \"disable_notification\": true}" \
     https://api.telegram.org/bot${TELEGRAM_BOT_TOKEN}/sendMessage
#        sudo systemctl restart suid
        echo -e "Transaction is stopped\n"
        echo "Trans 1 =" $SOHRAN " Trans 2 =" $SOHRAN2 " Difference =" $RESULT
fi

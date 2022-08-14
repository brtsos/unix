#!/bin/sh

clipboard_content=`xclip -o -selection clipboard`

generate_post_data()
{
  cat <<EOF
{
  "header": "$clipboard_content",
  "auth": "pta.HVB2cvn7kzp3ywt"
}
EOF
}

curl -X POST -H "Content-type: application/json" -d "$(generate_post_data)" 'https://hook.eu1.make.com/5r6n1nlglcriv1mr6m5ufo96wxsyxru8'
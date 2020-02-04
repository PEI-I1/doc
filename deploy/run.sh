#!/bin/bash

read -p "TELEGRAM API TOKEN: " BOT_TOKEN
read -p "OMDB API TOKEN: " OMDB_TOKEN

ngrok http 5000 --log=stdout > ngrok.log &

NGROK_URL=""
while [ -z $NGROK_URL ]
do
    NGROK_URL=$(curl --silent http://127.0.0.1:4040/api/tunnels | grep -Po --color 'https://[0-9a-z]+\.ngrok\.io')
done

export BOT_TOKEN=$BOT_TOKEN
export NGROK_URL=$NGROK_URL
export OMDB_TOKEN=$OMDB_TOKEN
docker-compose up

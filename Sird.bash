#!/bin/bash
read -p "Digite a URL do site: " url
files=(
    ".env"
    "backup.sql"
    "config.php"
    "admin/"
    ".pdf"
)

for file in "${files[@]}"
do
    response=$(curl -s -o /dev/null -w "%{http_code}" "$url/$file")

    if [ "$response" == "200" ]
    then
        echo "Arquivo encontrado: $url/$file"
    fi
done

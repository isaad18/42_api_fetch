#!/bin/bash

source .env

mkdir users
mkdir pretty

function get_token {
  local response=$(curl -s -X POST \
    https://api.intra.42.fr/oauth/token \
    -H 'Content-Type: application/x-www-form-urlencoded' \
    -d "grant_type=client_credentials&client_id=$CLIENT_ID&client_secret=$CLIENT_SECRET")
  local token=$(echo "$response" | jq -r '.access_token')
  echo "$token"
}

function get_users {
  local all_users=()
  local page_nb=1
  while true; do
    local response=$(curl -s -H "Authorization: Bearer $TOKEN" "https://api.intra.42.fr/v2/campus/$CAMPUS_ID/users?per_page=100&page=$page_nb")
    local users=($(echo "$response" | jq -r '.[] | .login'))
    if [ ${#users[@]} -eq 0 ]; then
      break
    fi
    all_users+=("${users[@]}")
    ((page_nb++))
  done
  echo "${all_users[@]}"
}

function get_all_info {
  local users=($@)
  local all_users=()
  local count=0
  for user in "${users[@]}"; do
    local response=$(curl -s -H "Authorization: Bearer $TOKEN" "https://api.intra.42.fr/v2/users/$user")
    all_users+=("$response")
    ((count++))
    echo "Processed $count users." > counter.txt
    echo "$response" > "users/$user.json"
    jq '.' ./users/$user.json > ./pretty/$user.json
    sleep 4
  done
  echo "${all_users[@]}"
}

TOKEN=$(get_token)

USERS=$(get_users)
ALL_INFO=$(get_all_info "${USERS[@]}")

echo "$ALL_INFO" > all_info.json

sleep 2

jq '.' all_info.json > users.json


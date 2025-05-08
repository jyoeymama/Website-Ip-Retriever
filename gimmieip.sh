#!/bin/bash

get_real_ip() {
  local domain=$1
  if ! command -v dig &> /dev/null; then
    echo "dig command not found. Please install it to proceed."
    exit 1
  fi
  real_ip=$(dig +short $domain | grep -E '^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$' | head -n 1)
  if [ -z "$real_ip" ]; then
    echo "Could not resolve the IP address for $domain"
    exit 1
  else
    echo "The real IP address of $domain is: $real_ip"
  fi
}


if [ -z "$1" ]; then
  echo "Usage: $0 <domain>"
  exit 1
fi


get_real_ip $1

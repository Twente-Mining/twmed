#!/usr/bin/env bash

if [[ -z $1 ]]; then
  echo "Usage: $0 [bv1|bv2|bv3|bv4]"
  echo "Downloads the latest snapshot from a validator"
  exit 0
fi

case $1 in
bv1)
  host=145.40.67.83
  ;;
bv2)
  host=147.75.38.117
  ;;
bv3)
  host=145.40.93.177
  ;;
bv4)
  host=86.109.15.59
  ;;
bw2)
  host=145.40.93.71
  ;;
tv)
  host=testnet.solana.com
  ;;
*)
  echo "Error: unknown validator: '$1'"
  exit 1
  ;;
esac

set -ex
cd ~/ledger

if [[ $2 != i ]]; then
  wget --trust-server-names http://$host/snapshot.tar.bz2
fi
if [[ $2 != f ]]; then
  exec wget --trust-server-names http://$host/incremental-snapshot.tar.bz2
fi
#!/bin/bash

./clean.sh

docker compose up create-beacon-chain-genesis

# Add blobSchedule
jq '.config.blobSchedule = {
  "cancun": {
    "target": 3,
    "max": 6,
    "baseFeeUpdateFraction": 3338477
  },
  "prague": {
    "target": 6,
    "max": 9,
    "baseFeeUpdateFraction": 5007716
  }
}' execution/genesis.json > execution/genesis_temp.json

mv execution/genesis_temp.json execution/genesis.json

docker compose up geth-remove-db geth-genesis geth beacon-chain validator -d
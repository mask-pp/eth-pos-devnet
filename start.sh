#!/bin/bash

./clean.sh

docker compose up create-beacon-chain-genesis

docker compose up geth-remove-db geth-genesis geth beacon-chain validator -d
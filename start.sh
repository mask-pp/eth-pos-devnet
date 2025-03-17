#!/bin/bash

# Stop docker compose and clean env.
./clean.sh

docker compose up create-beacon-chain-genesis

# Init and start geth
docker compose up geth-remove-db geth-genesis geth -d

# Start beacon-chain and validator
 docker compose up beacon-chain validator -d

#~/Downloads/prysmctl-v5.3.1-darwin-arm64 testnet generate-genesis --fork=fulu --num-validators=64 --genesis-time-delay=15 --chain-config-file=$HOME/projects/ethereum/eth-pos-devnet/consensus/config.yml --geth-genesis-json-in=$HOME/projects/ethereum/eth-pos-devnet/execution/genesis.json --geth-genesis-json-out=$HOME/projects/ethereum/eth-pos-devnet/execution/genesis_tmp.json --output-json=$HOME/projects/ethereum/eth-pos-devnet/consensus/genesis.json
#~/Downloads/validator-v5.3.1-darwin-arm64 --beacon-rpc-provider=localhost:4000 --datadir=$HOME/projects/ethereum/eth-pos-devnet/consensus/validatordata --accept-terms-of-use --interop-num-validators=64 --interop-start-index=0 --chain-config-file=$HOME/projects/ethereum/eth-pos-devnet/consensus/config.yml --force-clear-db
#~/Downloads/beacon-chain-v5.3.1-darwin-arm64 --datadir=$HOME/projects/ethereum/eth-pos-devnet/consensus/beacondata --min-sync-peers=0 --genesis-state=$HOME/projects/ethereum/eth-pos-devnet/consensus/genesis.ssz --interop-eth1data-votes --chain-config-file=$HOME/projects/ethereum/eth-pos-devnet/consensus/config.yml --contract-deployment-block=0 --chain-id=32382 --rpc-host=0.0.0.0 --grpc-gateway-host=0.0.0.0 --execution-endpoint=http://localhost:8551 --accept-terms-of-use --jwt-secret=$HOME/projects/ethereum/eth-pos-devnet/execution/jwtsecret --suggested-fee-recipient=0x123463a4b065722e99115d6c222f267d9cabb524
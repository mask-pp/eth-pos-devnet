docker rm -f $(docker ps -a -q)
rm -Rf ./consensus/beacondata ./consensus/validatordata ./consensus/genesis.ssz
rm -Rf ./execution/geth
rm execution/geth.ipc
docker ps -a
docker rm -f $(docker ps -a -q) 2> /dev/null
rm -Rf ./consensus/beacondata ./consensus/validatordata ./consensus/genesis.ssz
rm -Rf ./execution/geth execution/geth.ipc
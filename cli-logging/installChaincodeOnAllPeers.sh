docker exec -e "CORE_PEER_MSPCONFIGPATH=/etc/hyperledger/msp/users/Admin@org1.example.com/msp" peer0.org1.example.com peer chaincode install -n example02 -v 1.0.0 -l node -p /opt/gopath/src/github.com/hyperledger/fabric/chain
docker exec -e "CORE_PEER_MSPCONFIGPATH=/etc/hyperledger/msp/users/Admin@org1.example.com/msp" peer0.org1.example.com peer chaincode instantiate -o orderer.example.com:7050 -C mychannel -n example02 -l node -v 1.0.0 -c '{"Args":["init","a", "100", "b","200"]}'
sleep 3
docker exec -e "CORE_PEER_MSPCONFIGPATH=/etc/hyperledger/msp/users/Admin@org1.example.com/msp" peer1.org1.example.com peer chaincode install -n example02 -v 1.0.0 -l node -p /opt/gopath/src/github.com/hyperledger/fabric/chain
docker exec -e "CORE_PEER_MSPCONFIGPATH=/etc/hyperledger/msp/users/Admin@org1.example.com/msp" peer1.org1.example.com peer chaincode query -C mychannel -n example02 -c '{"Args":["query","b"]}'
sleep 3
docker exec -e "CORE_PEER_MSPCONFIGPATH=/etc/hyperledger/msp/users/Admin@org2.example.com/msp" peer0.org2.example.com peer chaincode install -n example02 -v 1.0.0 -l node -p /opt/gopath/src/github.com/hyperledger/fabric/chain
docker exec -e "CORE_PEER_MSPCONFIGPATH=/etc/hyperledger/msp/users/Admin@org2.example.com/msp" peer0.org2.example.com peer chaincode query -C mychannel -n example02 -c '{"Args":["query","b"]}'
sleep 3
docker exec -e "CORE_PEER_MSPCONFIGPATH=/etc/hyperledger/msp/users/Admin@org2.example.com/msp" peer1.org2.example.com peer chaincode install -n example02 -v 1.0.0 -l node -p /opt/gopath/src/github.com/hyperledger/fabric/chain
docker exec -e "CORE_PEER_MSPCONFIGPATH=/etc/hyperledger/msp/users/Admin@org2.example.com/msp" peer1.org2.example.com peer chaincode query -C mychannel -n example02 -c '{"Args":["query","b"]}'


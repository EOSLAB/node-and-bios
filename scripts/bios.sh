#!/bin/bash

# vars
. settings.sh

# eosio.bios
echo "Initializing eosio.bios contract..."
cleos -u http://$CLEOS_URL --wallet-url http://$KEOSD_URL set contract eosio $BUILD_DIR/contracts/eosio.bios $BUILD_DIR/contracts/eosio.bios/eosio.bios.wast $BUILD_DIR/contracts/eosio.bios/eosio.bios.abi
echo "eosio.bios contract loaded"

# create accounts
echo "Creating accounts..."
cleos -u http://$CLEOS_URL --wallet-url http://$KEOSD_URL create account eosio eosio.token EOS6Db7xTEMMAXTqSSmBDnhD3XX924zqK9yGLVfZKjrDAarrY48f1 EOS6Db7xTEMMAXTqSSmBDnhD3XX924zqK9yGLVfZKjrDAarrY48f1
cleos -u http://$CLEOS_URL --wallet-url http://$KEOSD_URL create account eosio $MAIN_ACCOUNT EOS6Db7xTEMMAXTqSSmBDnhD3XX924zqK9yGLVfZKjrDAarrY48f1 EOS6Db7xTEMMAXTqSSmBDnhD3XX924zqK9yGLVfZKjrDAarrY48f1
echo "Accounts created"

# set eosio.system
echo "Setting eosio.system contract..."
cleos -u http://$CLEOS_URL --wallet-url http://$KEOSD_URL set contract eosio $BUILD_DIR/contracts/eosio.system $BUILD_DIR/contracts/eosio.system/eosio.system.wast $BUILD_DIR/contracts/eosio.system/eosio.system.abi
echo "eosio.system contract set"

# set eosio.token
echo "Setting eosio.token contract..."
cleos -u http://$CLEOS_URL --wallet-url http://$KEOSD_URL set contract eosio $BUILD_DIR/contracts/eosio.token $BUILD_DIR/contracts/eosio.token/eosio.token.wast $BUILD_DIR/contracts/eosio.token/eosio.token.abi
echo "eosio.token contact set"

# create tokens
echo "Creating initial tokens..."
cleos -u http://$CLEOS_URL --wallet-url http://$KEOSD_URL push action eosio create '["eosio","1000000000.0000 EOS", 0, 0, 0]' -p eosio@active
cleos -u http://$CLEOS_URL --wallet-url http://$KEOSD_URL push action eosio issue '["eosio.token",  "1000000000.0000 EOS", "init"]' -p eosio@active
echo "Tokens created"

# issue tokens via simulated snapshot
echo "Issuing tokens to the accounts..."
cleos -u http://$CLEOS_URL --wallet-url http://$KEOSD_URL transfer eosio.token $MAIN_ACCOUNT 10000000000000 'Snapshot'
echo "Tokens issued"
echo "."
echo "."
echo "."
echo "Bios complete!"

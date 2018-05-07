#!/bin/bash

# vars
ENVIRONMENT="local"
CLEOS_URL="http://localhost:8888"
BUILD_DIR="$HOME/eos/build"
MAIN_ACCOUNT="eosbpone"

# eosio.bios
echo "Initializing eosio.bios contract..."
cleos -u $CLEOS_URL set contract eosio \
  $BUILD_DIR/contracts/eosio.bios \
  $BUILD_DIR/contracts/eosio.bios/eosio.bios.wast \
  $BUILD_DIR/contracts/eosio.bios/eosio.bios.abi

echo "eosio.bios contract loaded"

# create accounts
echo "Creating accounts..."
cleos -u $CLEOS_URL create account eosio eosio.token EOS6Db7xTEMMAXTqSSmBDnhD3XX924zqK9yGLVfZKjrDAarrY48f1 EOS6Db7xTEMMAXTqSSmBDnhD3XX924zqK9yGLVfZKjrDAarrY48f1
cleos -u $CLEOS_URL create account eosio $MAIN_ACCOUNT EOS6Db7xTEMMAXTqSSmBDnhD3XX924zqK9yGLVfZKjrDAarrY48f1 EOS6Db7xTEMMAXTqSSmBDnhD3XX924zqK9yGLVfZKjrDAarrY48f1
echo "Accounts created"

# set producers
if [ $ENVIRONMENT = "production" ]
then
   echo "Setting producers..."
   cleos -u $CLEOS_URL push action eosio setprods ~/testnet/data/setprods.json -p eosio@active
   echo "Producers set"
else
   echo "Skipping the settings of producers since we're not in production"
fi

# set eosio.system
echo "Setting eosio.system contract..."
cleos -u $CLEOS_URL set contract eosio \
  $BUILD_DIR/contracts/eosio.system \
  $BUILD_DIR/contracts/eosio.system/eosio.system.wast \
  $BUILD_DIR/contracts/eosio.system/eosio.system.abi
echo "eosio.system contract set"

# set eosio.token
echo "Setting eosio.token contract..."
cleos -u $CLEOS_URL set contract eosio \
  $BUILD_DIR/contracts/eosio.token \
  $BUILD_DIR/contracts/eosio.token/eosio.token.wast \
  $BUILD_DIR/contracts/eosio.token/eosio.token.abi
echo "eosio.token contact set"

# create tokens
echo "Creating initial tokens..."
cleos -u $CLEOS_URL push action eosio create ./data/create-token.json -p eosio@active
cleos -u $CLEOS_URL push action eosio issue ./data/issue-token.json -p eosio@active
echo "Tokens created"

# issue tokens via simulated snapshot
echo "Issuing tokens to the accounts..."
cleos -u $CLEOS_URL transfer eosio.token $MAIN_ACCOUNT 100000000000 'Initial transfer from eosio to $MAIN_ACCOUNT'
echo "Tokens issued"
echo "Bios complete!"

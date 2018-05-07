#!/bin/bash

# vars
CLEOS_URL="http://localhost:8888"
MAIN_ACCOUNT="eosbpone"

# Create accounts
cleos -u $CLEOS_URL create account eosio account.1 EOS6Db7xTEMMAXTqSSmBDnhD3XX924zqK9yGLVfZKjrDAarrY48f1 EOS6Db7xTEMMAXTqSSmBDnhD3XX924zqK9yGLVfZKjrDAarrY48f1
cleos -u $CLEOS_URL create account eosio account.2 EOS6Db7xTEMMAXTqSSmBDnhD3XX924zqK9yGLVfZKjrDAarrY48f1 EOS6Db7xTEMMAXTqSSmBDnhD3XX924zqK9yGLVfZKjrDAarrY48f1
cleos -u $CLEOS_URL create account eosio account.3 EOS6Db7xTEMMAXTqSSmBDnhD3XX924zqK9yGLVfZKjrDAarrY48f1 EOS6Db7xTEMMAXTqSSmBDnhD3XX924zqK9yGLVfZKjrDAarrY48f1
cleos -u $CLEOS_URL create account eosio account.4 EOS6Db7xTEMMAXTqSSmBDnhD3XX924zqK9yGLVfZKjrDAarrY48f1 EOS6Db7xTEMMAXTqSSmBDnhD3XX924zqK9yGLVfZKjrDAarrY48f1
cleos -u $CLEOS_URL create account eosio account.5 EOS6Db7xTEMMAXTqSSmBDnhD3XX924zqK9yGLVfZKjrDAarrY48f1 EOS6Db7xTEMMAXTqSSmBDnhD3XX924zqK9yGLVfZKjrDAarrY48f1

# Transfer funds to accounts
cleos -u $CLEOS_URL transfer $MAIN_ACCOUNT account.1 62123 '{"type": "expense", "class": "technical", "category": "server", "account": "hardware upgrades", "detail": "replacing power supply"}'
cleos -u $CLEOS_URL transfer $MAIN_ACCOUNT account.1 1102332 '{"type": "expense", "class": "administrative", "category": "personnel", "account": "administrator", "detail": "john does bi-weekly salary"}'
cleos -u $CLEOS_URL transfer $MAIN_ACCOUNT account.1 1232112 '{"type": "expense", "class": "administrative", "category": "personnel", "account": "administrator", "detail": "john smiths bi-weekly salary"}'
cleos -u $CLEOS_URL transfer $MAIN_ACCOUNT account.1 3009382 '{"type": "expense", "class": "community benefit", "subclass": "meetups", "category": "G & A", "account": "rent", "detail": "Hotel conference hall venue on march 20, 2018"}'
cleos -u $CLEOS_URL transfer $MAIN_ACCOUNT account.1 122212 'Here is a payment that is not formatted with JSON'
cleos -u $CLEOS_URL transfer $MAIN_ACCOUNT account.1 223223 'Here is a note before formatted JSON which we are triggering with a tag [report]: {"type": "expense", "class": "technical", "category": "server", "account": "hardware upgrades", "detail": "Upgrade storage"}'
cleos -u $CLEOS_URL transfer account.1 $MAIN_ACCOUNT 78777 '{"type": "refund", "detail": "Reimbursing $MAIN_ACCOUNT for a mistake"}'
cleos -u $CLEOS_URL transfer account.1 $MAIN_ACCOUNT 198880 'Here is a "To" payment with improper JSON'
cleos -u $CLEOS_URL transfer account.1 $MAIN_ACCOUNT 201980 'Here is a "To" payment with valid JSON following a tag [report]: {"type": "expense", "account": "misc", detail": "Office party"}'

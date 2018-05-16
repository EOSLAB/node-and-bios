# Node and Bios

This is a quick way to launch a node and local testnet. 

## Setup

Please take a look at the `sample_config.ini` and replace the placeholder data with information specific to you, your account, and your keys. After doing so, rename the file `config.ini`.

Head to the `scripts` folder and update the `settings.sh` variables to match your environment and setup.

## Starting and Stopping

To start your node, navigate to the `scripts` folder and run the `start.sh` script.
To stop your node, navigate to the `scripts` folder and run the `stop.sh` script.

## BIOS

The scripts folder has everything you need, though the `bios.sh` requires heavy modification for your particular use-case. As is, the `bios.sh` will boot up a very simple testnet wherein "eosio" will be the only producer and your $MAIN_ACCOUNT will be seeded with all of the EOS.

To set producers, you will need to add a line in the bios to set the producers.

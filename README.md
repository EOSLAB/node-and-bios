# Node and Bios

This is a quick way to launch a node and local testnet. 

## Setup

Please take a look at the `sample_config.ini` and replace the placeholder data with information specific to you, your account, and your keys. After doing so, rename the file `config.ini`.

## Starting and Stopping

To start your node, navigate to the `scripts` folder and run the `start.sh` script.
To stop your node, navigate to the `scripts` folder and run the `stop.sh` script.

The scripts folder has everything you need, though the `bios.sh` requires heavy modification for your particular use-case.

## BIOS

If you are launching the net (as opposed to simply joining an existing net), you will make use of the `bios.sh` script.

The `bios.sh` script located in the `scripts` folder needs some very heavy modification specific to the testnet you are launching.

Specifically, you should modify the accounts, the producers (in `data/setprods.json`), and the token issuance to those accounts.

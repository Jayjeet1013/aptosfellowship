# aptosfellowship



Install Aptos CLI:
https://aptos.dev/tools/aptos-cli/install-cli/automated-install

Run command `aptos`

Setup new Aptos Move Project
aptos move init --name debug

Create our own profile
aptos init --network devnet

Open move.toml and add your address here as - 

[addresses]
MyAddr ='<from your prev terminal response>'

Open sources and create a new file 'example.move' 

Compile with `aptos move compile` check for any errors

Run test with `aptos move test` 

Publish with `aptos move publish`

Balance of Account `aptos account list --query balance`

Fund Account with 1 APT `aptos account fund-with-faucet`

Run Function `aptos move run --function-id address::Colln::add_item` //needs to be a entry function 

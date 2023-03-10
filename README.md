# Soroswap - AMM in Soroban
Soroswap is full-stack implementation of a Liquidity Pool (AMM) in Soroban. It allows you to provide liquidity and swap your favorite tokens with the power of Soroban, React.js and [@soroban-react](https://github.com/esteblock/soroban-react/) lib. 

Project developed in the context of the [hacka-soroban-athon](https://hacka-soroban-athon.devpost.com/)

๐ง๐ฅAwarded 3rd prize!!!!๐๐

Check the [project's page](https://devpost.com/software/soroswap-liquidity-pool-dapp-in-soroban) for the hackathon.

## Usage

```
yarn
./quickstart.sh standalone
./initialize.sh standalone
cd front-end
yarn dev
```


Remember to fund your waller with XLM
http://localhost:8000/friendbot?addr=[WALLET]

Open [http://localhost:3000](http://localhost:3000) with your browser to see the result.


### Dependencies

1. `soroban-cli v0.4.0`. See https://soroban.stellar.org/docs/getting-started/setup#install-the-soroban-cli
2. `docker` (both Standalone and Futurenet backends require it).
3. `Node.js v17`
4. `Freighter wallet v2.9.1`. Download it from https://github.com/stellar/freighter/releases/tag/2.9.1 and Enable "Experimental Mode" in the settings (gear icon).

### Backend (Local Standalone Network)

1. Run the backend docker container with `./quickstart.sh standalone`, and wait for it to start.
2. Run `./initialize.sh standalone` to load the contracts and initialize it.
  - Note: this state will be lost if the quickstart docker container is removed.
3. Add the Standalone custom network in Freighter
    |   |   |
    |---|---|
    | Name | Standalone |
    | URL | http://localhost:8000/soroban/rpc |
    | Passphrase | Standalone Network ; February 2017 |
    | Allow HTTP connection | Enabled |
    | Switch to this network | Enabled |
4. Add some Standalone network lumens to your Freighter wallet.
  a. Copy the address for your freighter wallet.
  b. Visit `http://localhost:8000/friendbot?addr=<your address>`

### Backend (Futurenet)

1. Run the backend docker container with `./quickstart.sh futurenet`, and wait for it to start.
  - Note: This can take up to 5 minutes to start syncing. You can tell it is
    working by visiting http://localhost:8000/, and look at the
    `ingest_latest_ledger`, field. If it is `0`, the quickstart image is not
    ready yet.
2. Run `./initialize.sh futurenet` to load the contracts and initialize it.
3. Add the Futurenet custom network in Freighter
  (Note, the out-of-the-box "Future Net" network in
  Freighter will not work with a local quickstart container, so we need to add
  our own):
    |   |   |
    |---|---|
    | Name | Futurenet Local RPC|
    | URL | http://localhost:8000/soroban/rpc |
    | Passphrase | Test SDF Future Network ; October 2022 |
    | Allow HTTP connection | Enabled |
    | Switch to this network | Enabled |
4. Add some Futurenet network lumens to your Freighter wallet.
  - Visit https://laboratory.stellar.org/#create-account, and follow
    the instructions to create your freighter account on Futurenet.

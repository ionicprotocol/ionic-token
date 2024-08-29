source .env
forge script ./script/Deploy.s.sol --tc DeployBoB --ffi --json --rpc-url bob --private-key $MODE_PRIVATE_KEY --broadcast --verify --verifier blockscout --verifier-url https://explorer.gobob.xyz/api? -vvv

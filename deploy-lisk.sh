source .env
forge script ./script/Deploy.s.sol --tc DeployLisk --ffi --json --rpc-url lisk --private-key $MODE_PRIVATE_KEY --broadcast --verify --verifier blockscout --verifier-url https://blockscout.lisk.com/api? -vvv

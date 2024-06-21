source .env
forge script ./script/Deploy.s.sol --tc DeployBase --broadcast --ffi --json --rpc-url base --chain base --private-key $MODE_PRIVATE_KEY --verify -vvv

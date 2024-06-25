source .env
forge script ./script/Deploy.s.sol --tc DeployOptimism --broadcast --ffi --json --rpc-url optimism --chain optimism --private-key $MODE_PRIVATE_KEY --verify -vvv

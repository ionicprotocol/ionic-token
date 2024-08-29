source .env
forge script ./script/Deploy.s.sol --tc DeployFraxtal --broadcast --ffi --json --rpc-url fraxtal --chain fraxtal --private-key $MODE_PRIVATE_KEY --verify -vvv

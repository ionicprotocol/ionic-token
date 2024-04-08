source .env
forge script ./script/Deploy.s.sol --ffi --json --rpc-url mode --private-key $MODE_PRIVATE_KEY --broadcast --verify --verifier blockscout --verifier-url https://explorer.mode.network/api? -vvv

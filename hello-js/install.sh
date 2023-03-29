#extism-js-aarch64-linux-v0.4.0.gz

export TAG="v0.4.0"
export ARCH="aarch64"
export OS="linux"
curl -L -O "https://github.com/extism/js-pdk/releases/download/$TAG/extism-js-$ARCH-$OS-$TAG.gz"
gunzip extism-js*.gz
sudo mv extism-js-* /usr/local/bin/extism-js
chmod +x /usr/local/bin/extism-js

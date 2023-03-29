

## Install the compiler

```bash
curl -O https://raw.githubusercontent.com/extism/js-pdk/main/install.sh

sh install.sh
```

## Build the module

```bash
extism-js script.js -o hello-js.wasm
extism call hello-js.wasm helloJSWorld --input="Bob Morane" --wasi
```
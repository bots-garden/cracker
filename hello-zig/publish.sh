#!/bin/bash
set -o allexport; source .publish; set +o allexport

echo "📦 ${WASM_PACKAGE}"
echo "📝 ${WASM_MODULE} ${WASM_VERSION}"

curl --header "PRIVATE-TOKEN: ${GITLAB_WASM_TOKEN}" \
     --upload-file ${WASM_FILE} \
     "https://gitlab.com/api/v4/projects/${GITLAB_WASM_PROJECT_ID}/packages/generic/${WASM_PACKAGE}/${WASM_VERSION}/${WASM_MODULE}"

echo ""
echo "🌍 https://gitlab.com/bots-garden/wasm-registry/-/packages"

curl --header "PRIVATE-TOKEN: <your_access_token>" \
     "https://gitlab.example.com/api/v4/projects/24/packages/generic/my_package/0.0.1/file.txt"
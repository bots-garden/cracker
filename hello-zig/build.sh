#!/bin/bash
zig build hello_zig

ls -lh *.wasm ./zig-out/*.wasm

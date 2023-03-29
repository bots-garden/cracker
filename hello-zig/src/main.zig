const std = @import("std");
const extism_pdk = @import("extism-pdk");
const Plugin = extism_pdk.Plugin;
const http = extism_pdk.http;

pub fn main() void {}
const allocator = std.heap.wasm_allocator;

// define some type to write as output from the plugin back to the host
const Output = struct {
    message: []const u8,
    input: []const u8,
};


export fn hello_world() i32 {
    const plugin = Plugin.init(allocator);
    
    // Read the memory
    const input = plugin.getInput() catch unreachable; // this is the name
    defer allocator.free(input);
    
    const data = Output{ .message = "👋 Hello World 🌍 from Zig 🤗", .input = input };
    // json encoding
    const output = std.json.stringifyAlloc(allocator, data, .{}) catch unreachable;
    defer allocator.free(output);
 
    // write the plugin data back to the host
    plugin.output(output);

    return 0;
}

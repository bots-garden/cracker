const std = @import("std");

pub fn build(b: *std.Build) void {
    
    const optimize = b.standardOptimizeOption(.{});

    const target = b.standardTargetOptions(.{ 
        .default_target = .{ .abi = .musl, .os_tag = .freestanding, .cpu_arch = .wasm32 },
    });

    var hello = b.addExecutable(.{
        .name = "HelloZig",
        .root_source_file = .{ .path = "src/main.zig" },
        .target = target,
        .optimize = optimize,
    });

    hello.addAnonymousModule("extism-pdk", .{ .source_file = .{ .path = "libs/zig-pdk/src/main.zig" } });
    hello.rdynamic = true;
    hello.setOutputDir("zig-out");

    const hello_step = b.step("hello_zig", "Build hello_zig");
    hello_step.dependOn(&hello.step);

}

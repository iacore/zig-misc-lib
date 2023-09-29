const std = @import("std");

pub fn build(b: *std.Build) void {
    _ = b.addModule("time", .{
        .source_file = .{ .path = "time.zig" },
        .dependencies = &[_]std.Build.ModuleDependency{},
    });
}

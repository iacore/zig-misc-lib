const std = @import("std");

pub fn build(b: *std.Build) void {
    inline for (.{ "time", "sync", "misc" }) |name| {
        _ = b.addModule(name, .{
            .source_file = .{ .path = name ++ ".zig" },
            .dependencies = &[_]std.Build.ModuleDependency{},
        });
    }
    const tests = b.addTest(.{
        .root_source_file = .{ .path = "tests.zig" },
    });
    b.step("test", "Run tests").dependOn(&b.addRunArtifact(tests).step);
}

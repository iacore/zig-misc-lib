const std = @import("std");

pub fn todo(comptime loc: std.builtin.SourceLocation) void {
    const stderr = std.io.getStdErr().writer();
    stderr.print("todo in {s} / {s}:{}:{}\n", .{ loc.fn_name, loc.file, loc.line, loc.column }) catch {};
}

const std = @import("std");

/// Basic Future. Does not care about data leaking.
pub fn Future(comptime T: type) type {
    return struct {
        data: T = undefined,
        event: std.Thread.ResetEvent = .{},
        progress: std.Thread.ResetEvent = .{},

        pub fn stage(this: *@This()) void {
            this.progress.set();
        }

        pub fn set(this: *@This(), data: T) void {
            this.data = data;
            this.event.set();
            this.progress.reset();
        }

        pub fn getOrNull(this: @This()) ?T {
            if (this.event.isSet()) {
                return this.data;
            } else {
                return null;
            }
        }

        pub fn reset(this: *@This()) void {
            this.* = .{};
        }
    };
}

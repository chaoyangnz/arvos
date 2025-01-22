const console = @import("./console.zig");

pub fn init() void {
    const board = @import("build_options").board;

    switch (board) {
        .unmached => @import("./fu740/sys.zig").init(),
    }

    console.println("{s} initialised", .{@tagName(board)});
}

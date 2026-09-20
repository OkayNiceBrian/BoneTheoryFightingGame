const InputHandler = @import("input.zig").InputHandler;
const Timer = @import("time.zig").Timer;
const Player = @import("player/player.zig").Player;

pub const Game = struct {
    inputHandler: *InputHandler,
    timer: Timer = Timer{},

    player1: Player = Player{},
    player2: Player = Player{},

    pub fn update(self: *@This()) void {
        self.player1.update(self.inputHandler);
        self.player2.update(self.inputHandler);
        
        // INCREMENT TIMER
        self.timer.increment();
    }

    pub fn draw(self: *@This()) void {
        self.player1.draw();
        self.player2.draw();
    }

    pub fn load(self: *@This()) !void {
        try self.player1.load();
        try self.player2.load();
    }

    pub fn unload(self: *@This()) void {
        self.player1.unload();
        self.player2.unload();
    }
};
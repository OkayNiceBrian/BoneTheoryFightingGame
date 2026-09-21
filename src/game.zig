const InputHandler = @import("input.zig").InputHandler;
const Timer = @import("time.zig").Timer;
const Character = @import("character/character.zig").Character;
const rl = @import("raylib");

pub const Game = struct {
    inputHandler: *InputHandler,
    timer: Timer = Timer{},

    character1: Character = Character{},
    character2: Character = Character{ .position = rl.Vector2{.x = 400, .y = 250} },

    pub fn update(self: *@This()) void {
        self.character1.update(self.inputHandler);
        self.character2.update(self.inputHandler);
        
        // INCREMENT TIMER
        self.timer.increment();
    }

    pub fn draw(self: *@This()) void {
        self.character1.draw();
        self.character2.draw();
    }

    pub fn load(self: *@This()) !void {
        try self.character1.load();
        try self.character2.load();
    }

    pub fn unload(self: *@This()) void {
        self.character1.unload();
        self.character2.unload();
    }
};
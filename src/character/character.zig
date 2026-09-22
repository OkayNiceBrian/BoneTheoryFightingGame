const rl = @import("raylib");
const CharacterGraphics = @import("characterGraphics.zig").CharacterGraphics;
const Size2D = @import("../geometry.zig").Size2D;
const PlayerInputHandler = @import("../input.zig").PlayerInputHandler;
const Timer = @import("../time.zig").Timer;

const jump_velocity: f32 = -20;
const gravity: f32 = 5;

pub const Character = struct {
    const character_speed: f32 = 6;

    const maxHealth: f32 = 100.0;
    const maxMeter: f32 = 500.0;
    health: f32 = maxHealth,
    meter: f32 = maxMeter,

    position: rl.Vector2 = rl.Vector2{.x = 150, .y = 250},
    size: Size2D = Size2D{.w = 32, .h = 64},

    jumpTimer: Timer = Timer{.frameCount = 9000},
    isAirborne: bool = false,
    xVelocity: f32 = 0,
    yVelocity: f32 = 0,

    graphics: CharacterGraphics = CharacterGraphics{},


    pub fn update(self: *@This(), ih: *PlayerInputHandler) void {
        
        if (self.position.y < 250) { // Temporary airborne check
            self.isAirborne = true;
        } 

        if (ih.leftPressed) {
            self.xVelocity = -character_speed;
        }
        if (ih.rightPressed) {
            self.xVelocity = character_speed;
        }
        if (ih.rightPressed == ih.leftPressed) {
            // Slow down, don't just stop immediately
            if (self.xVelocity != 0) {
                self.xVelocity -= (self.xVelocity / @abs(self.xVelocity)) * 1;
            }
        }
        
        if (!self.isAirborne) {
            if (ih.upTapped) {
                self.yVelocity = jump_velocity;
                self.isAirborne = true;
                self.jumpTimer.reset();
            }
        }

        if (self.isAirborne) {
            self.yVelocity += gravity;

            // longer you press jump, higher you jump up to a point
            if (ih.upPressed and self.jumpTimer.frameCount < 8) {
                self.yVelocity = jump_velocity;
            }

            if (gravity < 1) {
                gravity = 1;
            }

            if (self.position.y > 250 - self.yVelocity) {
                self.position.y = 250;
                self.yVelocity = 0;
                self.isAirborne = false; 
            }

            if (self.jumpTimer.frameCount < 9000) {
                self.jumpTimer.increment();
            }
        }

        self.position.x += self.xVelocity;
        self.position.y += self.yVelocity;
    }

    pub fn draw(self: *@This()) void {
        self.graphics.draw(self);
    }

    pub fn load(self: *@This()) !void {
        try self.graphics.loadTextures();
    }

    pub fn unload(self: *@This()) void {
        self.graphics.unloadTextures();
    }
};
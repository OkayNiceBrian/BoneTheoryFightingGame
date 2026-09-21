const rl = @import("raylib");
const Character = @import("character.zig").Character;
const std = @import("std");

pub const CharacterGraphics = struct {
    characterTexture: rl.Texture2D = undefined,
    characterRect: rl.Rectangle = rl.Rectangle{.x = 0, .y = 0, .width = 64, .height = 64},
    
    pub fn draw(self: *@This(), character: *Character) void {
        rl.drawTextureRec(
            self.characterTexture,
            self.characterRect, 
            character.position, 
            rl.Color.white
        );
    }

    pub fn loadTextures(self: *@This()) !void {
        self.characterTexture = try rl.loadTexture("assets/character/bonedruid.png");
    }

    pub fn unloadTextures(self: *@This()) void {
        rl.unloadTexture(self.characterTexture);
    }
};
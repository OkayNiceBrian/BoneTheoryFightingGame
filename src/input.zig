const rl = @import("raylib");

pub const PlayerInputHandler = struct {
    // default button binds
    leftButton: rl.KeyboardKey = rl.KeyboardKey.a,
    rightButton: rl.KeyboardKey = rl.KeyboardKey.d,
    upButton: rl.KeyboardKey = rl.KeyboardKey.w,
    downButton: rl.KeyboardKey = rl.KeyboardKey.s,
    punchButton: rl.KeyboardKey = rl.KeyboardKey.u,
    kickButton: rl.KeyboardKey = rl.KeyboardKey.j,
    mediumButton: rl.KeyboardKey = rl.KeyboardKey.i,
    heavyButton: rl.KeyboardKey = rl.KeyboardKey.k,
    uniqueButton: rl.KeyboardKey = rl.KeyboardKey.o,
    assistButton: rl.KeyboardKey = rl.KeyboardKey.l,
    defendButton: rl.KeyboardKey = rl.KeyboardKey.p,
    throwButton: rl.KeyboardKey = rl.KeyboardKey.semicolon,
    selectButton: rl.KeyboardKey = rl.KeyboardKey.left_shift,
    startButton: rl.KeyboardKey = rl.KeyboardKey.escape,

    // pressed buttons
    leftPressed: bool = false,
    rightPressed: bool = false,
    upPressed: bool = false,
    downPressed: bool = false,
    punchPressed: bool = false,
    kickPressed: bool = false,
    mediumPressed: bool = false,
    heavyPressed: bool = false,
    uniquePressed: bool = false,
    assistPressed: bool = false,
    defendPressed: bool = false,
    throwPressed: bool = false,
    startPressed: bool = false,
    selectPressed: bool = false,

    // tapped buttons
    leftTapped: bool = false,
    rightTapped: bool = false,
    upTapped: bool = false,
    downTapped: bool = false,
    punchTapped: bool = false,
    kickTapped: bool = false,
    mediumTapped: bool = false,
    heavyTapped: bool = false,
    uniqueTapped: bool = false,
    assistTapped: bool = false,
    defendTapped: bool = false,
    throwTapped: bool = false,
    startTapped: bool = false,
    selectTapped: bool = false,

    // Motion inputs
    qcfActive: bool = false,
    qcbActive: bool = false,
    dpActive: bool = false,
    rdpActive: bool = false, // Reverse DP
    hcfActive: bool = false,
    hcbActive: bool = false,

    pub fn handleInput(self: *@This()) void {
        self.resetTappedKeys();
        self.handlePresses();
        self.handleReleases();
        self.recordInputsForCurrentFrame();
    }

    // TODO: Make key bindings dynamic
    fn handlePresses(self: *@This()) void {
        if (rl.isKeyPressed(self.leftButton)) {
            self.leftPressed = true;
            self.leftTapped = true;
        }

        if (rl.isKeyPressed(self.rightButton)) {
            self.rightPressed = true;
            self.rightTapped = true;
        }

        if (rl.isKeyPressed(self.upButton)) {
            self.upPressed = true;
            self.upTapped = true;
        }

        if (rl.isKeyPressed(self.downButton)) {
            self.downPressed = true;
            self.downTapped = true;
        }

        if (rl.isKeyPressed(self.punchButton)) {
            self.punchPressed = true;
            self.punchTapped = true;
        }

        if (rl.isKeyPressed(self.kickButton)) {
            self.kickPressed = true;
            self.kickTapped = true;
        }

        if (rl.isKeyPressed(self.mediumButton)) {
            self.mediumPressed = true;
            self.mediumTapped = true;
        }

        if (rl.isKeyPressed(self.heavyButton)) {
            self.heavyPressed = true;
            self.heavyTapped = true;
        }

        if (rl.isKeyPressed(self.uniqueButton)) {
            self.uniquePressed = true;
            self.uniqueTapped = true;
        }

        if (rl.isKeyPressed(self.assistButton)) {
            self.assistPressed = true;
            self.assistTapped = true;
        }

        if (rl.isKeyPressed(self.defendButton)) {
            self.defendPressed = true;
            self.defendTapped = true;
        }

        if (rl.isKeyPressed(self.throwButton)) {
            self.throwPressed = true;
            self.throwTapped = true;
        }

        if (rl.isKeyPressed(self.selectButton)) {
            self.selectPressed = true;
            self.selectTapped = true;
        }

        if (rl.isKeyPressed(self.startButton)) {
            self.startPressed = true;
            self.startTapped = true;
        }

        if (rl.isKeyUp(self.leftButton) and rl.isKeyUp(self.upButton) and rl.isKeyUp(self.rightButton) and rl.isKeyUp(self.downButton)) {
            // If no direction is input, record a 0 for the frame
        }
    }

    fn handleReleases(self: *@This()) void {
        if (rl.isKeyReleased(self.leftButton)) {
            self.leftPressed = false;
        }

        if (rl.isKeyReleased(self.rightButton)) {
            self.rightPressed = false;
        }

        if (rl.isKeyReleased(self.upButton)) {
            self.upPressed = false;
        }

        if (rl.isKeyReleased(self.downButton)) {
            self.downPressed = false;
        }

        if (rl.isKeyReleased(self.punchButton)) {
            self.punchPressed = false;
        }

        if (rl.isKeyReleased(self.kickButton)) {
            self.kickPressed = false;
        }

        if (rl.isKeyReleased(self.mediumButton)) {
            self.mediumPressed = false;
        }

        if (rl.isKeyReleased(self.heavyButton)) {
            self.heavyPressed = false;
        }

        if (rl.isKeyReleased(self.uniqueButton)) {
            self.uniquePressed = false;
        }

        if (rl.isKeyReleased(self.assistButton)) {
            self.assistPressed = false;
        }

        if (rl.isKeyReleased(self.defendButton)) {
            self.defendPressed = false;
        }

        if (rl.isKeyReleased(self.throwButton)) {
            self.throwPressed = false;
        }

        if (rl.isKeyReleased(self.selectButton)) {
            self.selectPressed = false;
        }

        if (rl.isKeyReleased(self.startButton)) {
            self.startPressed = false;
        }
    }

    fn resetTappedKeys(self: *@This()) void {
        self.leftTapped = false;
        self.rightTapped = false;
        self.upTapped = false;
        self.downTapped = false;
        self.punchTapped = false;
        self.kickTapped = false;
        self.mediumTapped = false;
        self.heavyTapped = false;
        self.uniqueTapped = false;
        self.assistTapped = false;
        self.defendTapped = false;
        self.throwTapped = false;
        self.startTapped = false;
        self.selectTapped = false;
    }

    fn recordInputsForCurrentFrame(self: *@This()) void {

    }
};
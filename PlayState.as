package {
    import org.flixel.*;

    public class PlayState extends FlxState {

        public var paddleLeft:FlxSprite;
        public var paddleRight:FlxSprite;
        public var ball:FlxSprite;

        override public function create() : void {
            add(new FlxText(0, 0, 100, "Hello, world!"));

            // make the objects
            paddleLeft = new FlxSprite(8, 120);
            paddleLeft.createGraphic(8, 8 * 4);
            add(paddleLeft);
            paddleRight = new FlxSprite(320 - 16, 120);
            paddleRight.createGraphic(8, 8 * 4);
            add(paddleRight);
            ball = new FlxSprite(160, 120);
            add(ball);

            // configure the gamepads
            FlxG.gamepads[0].bind("W", "S");
            FlxG.gamepads[1].bind("UP", "DOWN");
        }

        override public function update() : void {
            if (FlxG.gamepads[0].UP) {
                paddleLeft.y -= 1;
            }
            else if (FlxG.gamepads[0].DOWN) {
                paddleLeft.y += 1;
            }

            if (FlxG.gamepads[1].UP) {
                paddleRight.y -= 1;
            }
            else if (FlxG.gamepads[1].DOWN) {
                paddleRight.y += 1;
            }

            super.update();
        }

    }
}

package {
    import org.flixel.*;

    public class PlayState extends FlxState {

        public var paddleLeft:Paddle;
        public var paddleRight:Paddle;
        public var ball:Ball;
        public var stuff:FlxGroup;

        override public function create() : void {
            add(new FlxText(0, 0, 100, "Hello, world!"));

            // make the objects
            paddleLeft = new Paddle(8, 120);
            add(paddleLeft);
            paddleRight = new Paddle(320 - 16, 120);
            add(paddleRight);
            ball = new Ball(160, 120);
            add(ball);

            // make the playfield walls
            stuff = new FlxGroup();
            var wall:FlxSprite = new FlxSprite(0, -320);
            wall.createGraphic(320, 328);
            wall.fixed = true;
            wall.moves = false;
            wall.maxVelocity = new FlxPoint(0, 0);
            add(wall);
            stuff.add(wall);
            wall = new FlxSprite(0, 240 - 8);
            wall.createGraphic(320, 328);
            wall.fixed = true;
            wall.moves = false;
            wall.maxVelocity = new FlxPoint(0, 0);
            add(wall);
            stuff.add(wall);

            stuff.add(paddleLeft);
            stuff.add(paddleRight);
            stuff.add(ball);

            // configure the gamepads
            FlxG.gamepads[0].bind("W", "S");
            FlxG.gamepads[1].bind("UP", "DOWN");
        }

        override public function update() : void {
            // Need a ball?
            if (FlxG.keys.SPACE) {
                FlxG.log("YAY SERVING BALL :D");
                ball.serve();
            }

            // Control the paddles.
            paddleLeft.move(FlxG.gamepads[0]);
            paddleRight.move(FlxG.gamepads[1]);

            stuff.collide(stuff);

            super.update();
        }

    }
}

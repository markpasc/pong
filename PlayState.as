package {
    import org.flixel.*;

    public class PlayState extends FlxState {

        public var paddleLeft:Paddle;
        public var paddleRight:Paddle;
        public var ball:Ball;
        public var walls:FlxGroup;

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
            walls = new FlxGroup();
            var wall:FlxSprite = new FlxSprite(0, 0);
            wall.createGraphic(320, 8);
            wall.moves = false;
            wall.maxVelocity = new FlxPoint(0, 0);
            walls.add(wall);
            wall = new FlxSprite(0, 240 - 8);
            wall.createGraphic(320, 8);
            wall.moves = false;
            wall.maxVelocity = new FlxPoint(0, 0);
            walls.add(wall);
            add(walls);

            // configure the gamepads
            FlxG.gamepads[0].bind("W", "S");
            FlxG.gamepads[1].bind("UP", "DOWN");
        }

        override public function update() : void {
            // Need a ball?
            if (ball.dead && FlxG.keys.SPACE) {
                FlxG.log("YAY SERVING BALL :D");
                ball.serve();
            }

            // Control the paddles.
            paddleLeft.move(FlxG.gamepads[0]);
            paddleRight.move(FlxG.gamepads[1]);

            // Did the ball hit a paddle?
            var paddles:FlxGroup = new FlxGroup();
            paddles.add(paddleLeft);
            paddles.add(paddleRight);
            ball.collide(paddles);

            // Did something hit a wall?
            walls.collide(paddles);
            walls.collide(ball);

            super.update();
        }

    }
}

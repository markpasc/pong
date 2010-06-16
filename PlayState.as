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
            var wall:FlxObject = new FlxObject(160, -4);
            wall.width = 336;
            wall.height = 8;
            walls.add(wall);
            wall = new FlxObject(160, 244);
            wall.width = 336;
            wall.height = 8;
            walls.add(wall);

            // configure the gamepads
            FlxG.gamepads[0].bind("W", "S");
            FlxG.gamepads[1].bind("UP", "DOWN");

            ball.serve();
        }

        override public function update() : void {
            // Control the paddles.
            paddleLeft.move(FlxG.gamepads[0]);
            paddleRight.move(FlxG.gamepads[1]);

            // Did the ball hit a paddle?
            var paddles:FlxGroup = new FlxGroup();
            paddles.add(paddleLeft);
            paddles.add(paddleRight);
            ball.collide(paddles);

            walls.collide(paddles);
            walls.collide(ball);

            super.update();
        }

    }
}

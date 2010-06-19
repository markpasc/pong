package {
    import org.flixel.*;

    public class PlayState extends FlxState {

        public var paddleLeft:Paddle;
        public var paddleRight:Paddle;
        public var ball:Ball;
        public var stuff:FlxGroup;
        public var scorezoneLeft:FlxSprite;
        public var scorezoneRight:FlxSprite;

        public var serveLabel:FadeText;

        override public function create() : void {
            // Set big world bounds so Flixel will collide our score zones.
            FlxU.setWorldBounds(-320, -240, 960, 720);

            serveLabel = new FadeText(160 - 70, 140, 140, "space to serve");
            serveLabel.size = 8;
            serveLabel.alignment = "center";
            add(serveLabel);

            // make the objects
            paddleLeft = new Paddle(8, 120 - 16);
            add(paddleLeft);
            paddleRight = new Paddle(320 - 16, 120 - 16);
            add(paddleRight);

            // make the playfield walls
            stuff = new FlxGroup();
            var wall:FlxSprite = new FlxSprite(0, -320);
            wall.createGraphic(320, 328);
            wall.fixed = true;
            wall.maxVelocity = new FlxPoint(0, 0);
            add(wall);
            stuff.add(wall);
            wall = new FlxSprite(0, 240 - 8);
            wall.createGraphic(320, 328);
            wall.fixed = true;
            wall.maxVelocity = new FlxPoint(0, 0);
            add(wall);
            stuff.add(wall);

            stuff.add(paddleLeft);
            stuff.add(paddleRight);

            scorezoneLeft = new FlxSprite(-128, 0);
            scorezoneLeft.createGraphic(120, 240);
            scorezoneLeft.fixed = true;
            scorezoneLeft.maxVelocity = new FlxPoint(0, 0);
            add(scorezoneLeft);
            scorezoneRight = new FlxSprite(328, 0);
            scorezoneRight.createGraphic(120, 240);
            scorezoneRight.fixed = true;
            scorezoneRight.maxVelocity = new FlxPoint(0, 0);
            add(scorezoneRight);

            // configure the gamepads
            FlxG.gamepads[0].bind("W", "S");
            FlxG.gamepads[1].bind("UP", "DOWN");
        }

        override public function update() : void {
            // Need a ball?
            if (ball == null && FlxG.keys.SPACE) {
                FlxG.log("YAY SERVING BALL :D");

                ball = new Ball(160, 120);
                add(ball);
                ball.serve();
                serveLabel.fade();
            }

            // Control the paddles.
            paddleLeft.move(FlxG.gamepads[0]);
            paddleRight.move(FlxG.gamepads[1]);

            stuff.collide(stuff);
            if (ball != null) {
                // Don't let the ball push the paddles.
                paddleLeft.fixed = true;
                paddleRight.fixed = true;
                ball.collide(stuff);
                paddleLeft.fixed = false;
                paddleRight.fixed = false;

                if (ball.collide(scorezoneLeft) || ball.collide(scorezoneRight)) {
                    defaultGroup.remove(ball);
                    ball = null;
                }
            }

            super.update();
        }

    }
}

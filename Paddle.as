package {
    import org.flixel.*;
    import org.flixel.data.FlxGamepad;

    public class Paddle extends FlxSprite {
        public function Paddle(x:Number, y:Number) {
            super(x, y);
            createGraphic(8, 8 * 4);
            maxVelocity = new FlxPoint(0, 500);
        }

        override public function hitBottom(contact:FlxObject, velocity:Number) : void {
            acceleration.y = 0;
            this.velocity.y = 0;
        }
        override public function hitTop(contact:FlxObject, velocity:Number) : void {
            hitBottom(contact, velocity);
        }

        public function move(pad:FlxGamepad) : void {
            acceleration.y = pad.UP   ? -1000
                           : pad.DOWN ?  1000
                           :                0
                           ;

            // Also leak velocity.
            if (velocity.y > 10) {
                velocity.y -= 10;
            }
            else if (velocity.y < -10) {
                velocity.y += 10;
            }
            else {
                velocity.y = 0;
            }
        }
    }
}

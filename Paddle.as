package {
    import org.flixel.*;
    import org.flixel.data.FlxGamepad;

    public class Paddle extends FlxSprite {

        public var pad:FlxGamepad;

        [Embed(source="sound/hit.mp3")] private var hit:Class;

        public function Paddle(x:Number, y:Number, pad:FlxGamepad) {
            super(x, y);
            createGraphic(8, 8 * 4);
            maxVelocity = new FlxPoint(0, 500);
            this.pad = pad;
        }

        override public function hitSide(contact:FlxObject, velocity:Number) : void {
            // Don't move.
            FlxG.play(hit);
        }

        override public function hitBottom(contact:FlxObject, velocity:Number) : void {
            acceleration.y = 0;
            this.velocity.y = 0;
        }
        override public function hitTop(contact:FlxObject, velocity:Number) : void {
            hitBottom(contact, velocity);
        }

        override public function update() : void {
            acceleration.y /= 2;
            acceleration.y += pad.UP   ? -900
                            : pad.DOWN ?  900
                            :               0
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

            super.update();
        }
    }
}

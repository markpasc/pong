package {
    import org.flixel.*;

    public class Ball extends FlxSprite {
        override public function Ball(x:Number, y:Number) {
            super(x, y);
        }

        public function serve() : void {
            velocity.y = FlxU.random() * 10;
            velocity.x = FlxU.random() * 100 + 100;
        }

        override public function hitLeft(contact:FlxObject, velocity:Number) : void {
            this.velocity.x *= -1;
        }
        override public function hitRight(contact:FlxObject, velocity:Number) : void {
            hitLeft(contact, velocity);
        }
    }
}

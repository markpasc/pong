package {
    import org.flixel.*;

    public class Ball extends FlxSprite {
        override public function Ball(x:Number, y:Number) {
            super(x, y);
        }

        public function serve() : void {
            velocity.y = FlxU.random() * 100;
            velocity.x = FlxU.random() * 100 + 100;
        }

        override public function hitLeft(contact:FlxObject, velocity:Number) : void {
            this.velocity.x *= -1;
            this.velocity.x += 10;

            this.velocity.y = contact.velocity.y;
        }
        override public function hitRight(contact:FlxObject, velocity:Number) : void {
            this.velocity.x *= -1;
            this.velocity.x -= 10;

            this.velocity.y = contact.velocity.y;
        }

        override public function hitTop(contact:FlxObject, velocity:Number) : void {
            this.velocity.y *= -1;
        }
        override public function hitBottom(contact:FlxObject, velocity:Number) : void {
            hitTop(contact, velocity);
        }
    }
}

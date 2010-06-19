package {
    import org.flixel.*;

    public class Ball extends FlxSprite {

        public var originalX:Number;
        public var originalY:Number;

        override public function Ball(x:Number, y:Number) {
            originalX = x;
            originalY = y;
            super(x, y);
        }

        public function serve() : void {
            velocity.y = FlxU.random() * 100;
            velocity.x = FlxU.random() * 100 + 100;
        }

        override public function hitLeft(contact:FlxObject, velocity:Number) : void {
            this.velocity.x *= -1;
            this.velocity.x += 10;

            this.velocity.y += contact.velocity.y / 2;
        }
        override public function hitRight(contact:FlxObject, velocity:Number) : void {
            this.velocity.x *= -1;
            this.velocity.x -= 10;

            this.velocity.y += contact.velocity.y / 2;
        }

        override public function hitTop(contact:FlxObject, velocity:Number) : void {
            this.velocity.y *= -1;
        }
        override public function hitBottom(contact:FlxObject, velocity:Number) : void {
            hitTop(contact, velocity);
        }
    }
}

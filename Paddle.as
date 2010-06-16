package {
    import org.flixel.*;

    public class Paddle extends FlxSprite {
        public function Paddle(x:Number, y:Number) {
            super(x, y);
            createGraphic(8, 8 * 4);
            maxVelocity = new FlxPoint(0, 100);
        }
    }
}
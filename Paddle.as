package {
    import org.flixel.*;
    import org.flixel.data.FlxGamepad;

    public class Paddle extends FlxSprite {
        public function Paddle(x:Number, y:Number) {
            super(x, y);
            createGraphic(8, 8 * 4);
            maxVelocity = new FlxPoint(0, 100);
        }

        public function move(pad:FlxGamepad) : void {
            acceleration.y = pad.UP   ? -1000
                           : pad.DOWN ?  1000
                           :                0
                           ;
        }
    }
}

package {
    import org.flixel.*;

    public class FadeText extends FlxText {
        public var fading:Boolean;

        public function FadeText(X:Number, Y:Number, Width:uint, Text:String = null, EmbeddedFont:Boolean = true) {
            super(X, Y, Width, Text, EmbeddedFont);
            alpha = 1.0;
        }

        public function fade() : void {
            FlxG.log('YAY STARTING TO FADE ME SOME TEXT');
            fading = true;
        }

        override public function update() : void {
            if (fading) {
                FlxG.log('FADING PAST ' + alpha);
                if (alpha <= 0.05) {
                    FlxG.log('YAY DONE FADING');
                    alpha = 0.0;
                    fading = false;
                }
                else {
                    alpha -= 0.05;
                    FlxG.log('YAY FADING TO ' + alpha);
                }
            }

            super.update();
        }

    }
}
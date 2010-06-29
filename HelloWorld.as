package {
    import org.flixel.*;
    [SWF(width="768", height="480", backgroundColor="#000000")]

    public class HelloWorld extends FlxGame {
        public function HelloWorld() {
            super(384, 240, TitleState, 2);  // pixel doubled
        }
    }
}

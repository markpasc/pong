package {
    import org.flixel.*;

    public class TitleState extends FlxState {

        override public function create() : void {
            var label:FlxText = new FlxText(160, 150, 100, "Click to start");
            label.alignment = "center";
            add(label);
        }

        override public function update() : void {
            if (FlxG.mouse.justPressed()) {
                FlxG.state = new PlayState();
            }

            super.update();
        }

    }
}

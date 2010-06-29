package {
    import org.flixel.*;

    public class TitleState extends FlxState {

        public var label:FadeText;
        public var figure:FlxGroup;
        public var countdown:uint = 0;

        override public function create() : void {
            label = new FadeText(192 - 50, 150, 100, "Click to start");
            label.alignment = "center";
            add(label);

            figure = new FlxGroup();
            var ground:FlxGroup = new FlxGroup();

            var whitedata:Array = [
                [-8, 0, 1, 2],
                [-8, 2, 1, 2],
                [-7, 0, 1, 1],
                [-6, 0, 1, 2],
                [-7, 2, 2, 1],

                [-2, 0, 1, 3],
                [-3, 3, 2, 1],
                [-4, 2, 1, 2],
                [-4, 1, 1, 1],
                [-4, 0, 2, 1],

                [0, 0, 1, 2],
                [0, 2, 1, 2],
                [1, 1, 1, 1],
                [2, 2, 1, 1],
                [3, 0, 1, 2],
                [3, 2, 1, 2],

                [5, 0, 1, 2],
                [5, 2, 1, 2],
                [6, 0, 2, 1],
                [6, 3, 2, 1],
                [7, 2, 1, 1],
            ];

            var thing:FlxSprite;
            for (var i:String in whitedata) {
                var bit:Array = whitedata[i];
                thing = new FlxSprite(192 + 8 * bit[0], 80 + 8 * bit[1]);
                thing.createGraphic(8 * bit[2], 8 * bit[3]);
                figure.add(thing);
            }
            add(figure);

            var blackdata:Array = [
                [-8, 0, 3, 1],
                [-8, 0, 1, 4],
                [-8, 2, 3, 1],
                [-6, 0, 1, 3],

                [-4, 0, 3, 1],
                [-4, 0, 1, 4],
                [-2, 0, 1, 4],
                [-4, 3, 3, 1],

                [0, 0, 1, 4],
                [0, 1, 2, 1],
                [2, 2, 2, 1],
                [3, 0, 1, 4],

                [5, 0, 1, 4],
                [5, 0, 3, 1],
                [5, 3, 3, 1],
                [7, 2, 1, 2],
            ];

            for (i in blackdata) {
                bit = blackdata[i];
                thing = new FlxSprite(192 + 8 * bit[0] + 1, 80 + 8 * bit[1] + 1);
                thing.createGraphic(8 * bit[2] - 2, 8 * bit[3] - 2);
                thing.color = 0x00000000;
                ground.add(thing);
            }
            add(ground);
        }

        override public function update() : void {
            if (FlxG.mouse.justPressed()) {
                label.fade();

                for (var i:String in figure.members) {
                    var chunk:FlxObject = figure.members[i];
                    chunk.acceleration.x = FlxU.random() * 2000 - 1000;
                    chunk.acceleration.y = FlxU.random() * 2000 - 1000;
                }

                countdown = 50;
            }

            if (label.alpha == 0 && countdown-- == 0) {
                FlxG.state = new PlayState();
            }

            super.update();
        }

    }
}

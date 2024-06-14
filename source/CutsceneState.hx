import flixel.FlxG;
import flixel.FlxSprite;
import VideoHandler;

class CutsceneState extends MusicBeatState
{
	public var handler:VideoHandler;

	public var path:String = "";

	public function new(bruh)
	{
		path = bruh;
		super();
	}

	public function load()
	{
		handler = new VideoHandler();
	}

	public override function update(elapsed)
	{
		if (FlxG.keys.justPressed.ENTER)
		{
			MusicBeatState.switchState(new PlayState());
		}
		super.update(elapsed);
	}

	public override function create()
	{
		handler.playVideo(Paths.video(path));
		handler.finishCallback = function()
		{
			MusicBeatState.switchState(new PlayState());
		};
		super.create();
	}
}

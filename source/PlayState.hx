import apotu.CommandFileReader;
import flixel.FlxState;

class PlayState extends FlxState
{
    public var command_list:Array<String> = [];

    public var starting_file:String = 'assets/data/main.txt';

	override function create()
	{
		super.create();

        command_list = CommandFileReader.decodeCommandFile(starting_file);
	}
}

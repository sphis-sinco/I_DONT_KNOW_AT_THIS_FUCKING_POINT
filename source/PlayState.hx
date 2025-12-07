import apotu.CommandFileReader;
import flixel.FlxState;

class PlayState extends FlxState
{
    public var command_list:Array<String> = [];

    public var starting_file:String = 'assets/data/starting_file.txt';

	override function create()
	{
		super.create();

        command_list = CommandFileReader.decodeCommandFile(starting_file);
	}
}

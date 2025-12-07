import apotu.CommandGetter;
import lime.app.Application;
import apotu.CommandFileReader;
import flixel.FlxState;

class PlayState extends FlxState
{
	public static var command_list:Array<String> = [];
	public static var starting_file:String = 'assets/data/main.txt';

	public static var command_index:Int = 0;

	override function create()
	{
		super.create();

		command_list = CommandFileReader.decodeCommandFile(starting_file);
		readNextCommand();
	}

	public static function readNextCommand()
	{
		if (!CommandGetter.getCommand(command_list[command_index]))
			command_index++;

		if (command_index == command_list.length)
		{
			Application.current.window.alert('END OF PROGRAM.', 'EOP');
			Application.current.window.close();
		}
	}
}

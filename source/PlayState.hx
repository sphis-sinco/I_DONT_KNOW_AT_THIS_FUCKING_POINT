import lime.app.Application;
import apotu.CommandFileReader;
import flixel.FlxState;

class PlayState extends FlxState
{
	public var command_list:Array<String> = [];
	public var starting_file:String = 'assets/data/main.txt';

	public var command_index:Int = 0;

	override function create()
	{
		super.create();

		command_list = CommandFileReader.decodeCommandFile(starting_file);
		readNextCommand();
	}

	public function readNextCommand()
	{
		switch (command_list[command_index])
		{
			default:
				command_index++;
		}

        if (command_index == command_list.length)
        {
            Application.current.window.alert('END OF PROGRAM.', 'EOP');
            Application.current.window.close();
        }
	}
}

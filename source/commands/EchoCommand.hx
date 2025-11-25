package commands;

using StringTools;

class EchoCommand extends Command
{
	override function get_group():String
	{
		return 'echo';
	}

	override function parseCommandValue(split_command:Array<String>)
	{
		var echo:String = split_command[0];

		for (i in 0...split_command.length)
			if (i > 0)
				echo += " " + split_command[i];

		if (!(echo.startsWith('"') && echo.endsWith('"')))
		{
			Sys.println("[WARNING] Quotes (\"'s) should surround the echo input");
		}
		else
		{
			this.value = echo.substring(1, echo.length - 1);
			Sys.println(PlayState.instance.line_number + ' : ' + this.value);
		}
	}
}

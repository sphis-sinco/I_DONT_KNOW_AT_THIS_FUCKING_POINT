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
			if (echo.startsWith("@"))
			{
				var command:AtCommand = new AtCommand(this.command.substr(this.name.length + 1));
				command.parse();
				echo = command.value;

				if (echo.length > 0)
				{
					if ((echo.startsWith('"') && echo.endsWith('"')))
						this.value = echo.substring(1, echo.length - 1);
					else
						this.value = echo;
					Sys.println(PlayState.instance.filepath + ' / ' + PlayState.instance.line_number + ' : ' + this.value);
				}
			}
			else
				Sys.println("[WARNING] Quotes (\"'s) should surround the echo input");
		}
		else
		{
			this.value = echo.substring(1, echo.length - 1);
			Sys.println(PlayState.instance.filepath + ' / ' + PlayState.instance.line_number + ' : ' + this.value);
		}
	}
}

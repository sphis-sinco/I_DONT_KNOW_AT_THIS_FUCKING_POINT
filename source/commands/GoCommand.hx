package commands;

class GoCommand extends Command
{
	override function parseCommandValue(split_command:Array<String>)
	{
		super.parseCommandValue(split_command);

		var direction:String = split_command[0];

		switch (direction)
		{
			case "back":
				this.value = "" + -(Std.parseInt(split_command[1]));
			case "forward":
				this.value = split_command[1];
            case "to":
				this.value = "" + (Std.parseInt(split_command[1]) - PlayState.instance.line_number);

			default:
                this.value = "1";
				Sys.println("[WARNING] Unknown input for command: \""+this.name+"\" : " + split_command[0]);
		}
	}
}

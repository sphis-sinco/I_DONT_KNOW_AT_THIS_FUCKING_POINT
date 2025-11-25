package commands;

using StringTools;

/**
 * @
 */
class AtCommand extends Command
{
	override function parseCommandValue(split_command:Array<String>)
	{
		var func = split_command[0];

		switch (func)
		{
			case 'import':
				var import_cmd_or_group = split_command[1];
				var import_func = split_command[2];

				switch (import_func)
				{
					case 'add':
						Command.imported.push(import_cmd_or_group);
					case 'remove':
						Command.imported.remove(import_cmd_or_group);
					default:
						Sys.println("[WARNING] Unknown input for command: \"" + this.name + " import\" : " + func);
				}

			default:
				Sys.println("[WARNING] Unknown input for command: \"" + this.name + "\" : " + func);
		}
	}
}

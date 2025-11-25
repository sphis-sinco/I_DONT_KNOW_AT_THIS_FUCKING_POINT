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
				var import_func = split_command[1];
				var import_cmd_or_group = split_command[2];

				switch (import_func)
				{
					case 'add':
						Command.imported.push(import_cmd_or_group);
					case 'remove':
						Command.imported.remove(import_cmd_or_group);
					default:
						Sys.println("[WARNING] Unknown input for command: \"" + this.name + " import\" : " + import_func);
				}

			case 'variable':
				var var_func = split_command[1];
				var var_name = split_command[2];

				switch (var_func)
				{
					case 'remove':
						PlayState.instance.variables.remove(var_name);
						PlayState.instance.settable_variables.remove(var_name);
					case 'add', 'set':
						PlayState.instance.setVariable(var_name, split_command[3],
							(var_func == 'add' ? split_command[4].toLowerCase() == 'true' : PlayState.instance.settable_variables.contains(var_name)));
					case 'get':
						this.value = PlayState.instance.variables.get(var_name);

					default:
						Sys.println("[WARNING] Unknown input for command: \"" + this.name + " variable\" : " + var_func);
				}

			default:
				Sys.println("[WARNING] Unknown input for command: \"" + this.name + "\" : " + func);
		}
	}
}

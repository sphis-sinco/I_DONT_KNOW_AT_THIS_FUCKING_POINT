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
				var import_class = split_command[1];
		}
	}
}

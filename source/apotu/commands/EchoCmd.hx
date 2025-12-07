package apotu.commands;

class EchoCmd extends Cmd
{
	override public function new()
	{
		super('echo', false);
	}

	override function run(args:Array<String>)
	{
		var echo:String = '';

		for (arg in args)
		{
			var add_regularly:Bool = true;

			for (cmd in CommandGetter.command_classes)
			{
				if (cmd != this) {
					if (cmd.run([arg]) != null)
					{
						echo += cmd.run([arg]);
					}
				}
			}

			if (add_regularly)
				echo += arg + ' ';
		}

		Sys.println(echo);

		return super.run(args);
	}
}

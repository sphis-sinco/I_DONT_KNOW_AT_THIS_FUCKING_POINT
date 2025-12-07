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
			echo += arg + ' ';

		Sys.println(echo);
	}
}

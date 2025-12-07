package apotu.commands;

class VariableCmd extends Cmd
{
	public static var variables:Map<String, Dynamic> = [];

	override public function new()
	{
		super('variable', false);
	}

	override function run(args:Array<String>)
	{
		var func:String = args[0]; // get, set, remove ...
		var variable:String = args[1];
		var value:String = args[2];

		switch (func.toLowerCase())
		{
			case 'get':
				return variables.get(variable);
			case 'set':
				variables.set(variable, value);
			case 'remove':
				variables.remove(variable);
		}

		return super.run(args);
	}
}

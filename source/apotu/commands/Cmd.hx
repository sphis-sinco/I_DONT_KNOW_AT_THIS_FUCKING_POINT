package apotu.commands;

class Cmd
{
	public var prefix:String;
	public var override_index_increase:Bool;

	public function new(prefix:String, override_index_increase:Bool)
	{
		this.prefix = prefix;
		this.override_index_increase = override_index_increase;
	}

	public function run(args:Array<String>):Dynamic
	{
		return null;
	}
}

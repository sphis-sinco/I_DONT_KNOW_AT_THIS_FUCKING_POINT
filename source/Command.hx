package;

class Command
{
	public var name:String = '';
	public var value:String = '';

	public static var imported:Array<String> = ['base'];

	public var group(get, never):String;

	function get_group():String
		return 'base';

	var command:String;

	public function new(command:String)
	{
		this.command = command;
	}

	public function parse()
	{
		var split_command:Array<String> = this.command.split(" ");

		this.name = split_command[0];
		split_command.remove(split_command[0]);

		if (Command.imported.contains(name) || Command.imported.contains(group))
		{
			this.parseCommandValue(split_command);
		}
		else
		{
            // hehehe what if I threw an error >:)
			Sys.println('[WARNING] Unimported command (' + name + ') or group (' + group + ')');
		}
	}

	public function parseCommandValue(split_command:Array<String>) {}
}

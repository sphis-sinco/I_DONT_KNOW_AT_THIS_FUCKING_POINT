package;

class Command
{
	public var name:String = '';
	public var value:String = '';

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

		this.parseCommandValue(split_command);
	}

	public function parseCommandValue(split_command:Array<String>) {}
}

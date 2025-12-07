package apotu;

import apotu.commands.VariableCmd;
import apotu.commands.VarCmd;
import apotu.commands.Cmd;
import apotu.commands.EchoCmd;

class CommandGetter
{
	public static var command_classes:Array<Cmd> = [new EchoCmd(), new VarCmd(), new VariableCmd()];

	public static function getCommand(cmd:String):Bool
	{
		var decoded_cmd:Array<String> = CommandFileReader.decodeCommand(cmd);

		for (command_class in command_classes)
			if (command_class.prefix == decoded_cmd[0])
			{
				decoded_cmd.remove(decoded_cmd[0]);
				command_class.run(decoded_cmd);

				return command_class.override_index_increase;
				break;
			}

		return false;
	}
}

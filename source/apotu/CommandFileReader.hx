package apotu;

using StringTools;

class CommandFileReader
{
	public static function decodeCommandFile(file:String):Array<String>
	{
		var file_content:String;

		#if sys
		file_content = sys.io.File.getContent(file);
		#else
		file_content = lime.utils.Assets.getText(file);
		#end

		return file_content.split('\n');
	}

	public static function decodeCommand(command:String):Array<String>
	{
        var decoded_command:Array<String> = command.split(" : ");

        for (param in decoded_command)
        {
            param = param.replace('\\_:\\_', ' : ');
        }

		return decoded_command;
	}
}

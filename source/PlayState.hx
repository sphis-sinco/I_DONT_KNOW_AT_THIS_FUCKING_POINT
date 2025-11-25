package;

import haxe.Log;
import haxe.Json;
import lime.app.Application;
import sys.FileSystem;
import sys.io.File;
import flixel.FlxState;

using StringTools;

class PlayState extends FlxState
{
	var starting_point:String = '';

	override public function new()
	{
		super();

		starting_point = File.getContent('assets/data/starting_point.txt');

		if (!FileSystem.exists(starting_point))
		{
			Application.current.window.alert("The starting point file \"" + starting_point + "\" doesn't exist", "STARTING POINT DOESN'T EXIST");
			Sys.exit(0);
		}

		if (!starting_point.endsWith('.json'))
		{
			Application.current.window.alert("The starting point file doesn't link to a json, sry.", "NON-JSON STARTING POINT");
			Sys.exit(0);
		}

		// trace('Valid starting point!');
	}

	var commands:Array<String> = [];
	var line_number:Int = 0;

	override function create()
	{
		super.create();

		var json_file = Json.parse(File.getContent(starting_point));

		commands = cast json_file.commands;

		line_number++;
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (line_number < 1)
			return;

		readCommand(commands[line_number - 1]);
	}

	public function readCommand(command:String)
	{
		var line_number_add_amount = 1;
		var split_command:Array<String> = command.split(" ");

		switch (split_command[0])
		{
			case "echo":
				var echo:String = split_command[1];

				for (i in 0...split_command.length)
					if (i > 1)
						echo += " " + split_command[i];

				Sys.println(echo);

			case "go":
				var direction:String = split_command[1];

				switch (direction)
				{
					case "back":
						line_number_add_amount = -(Std.parseInt(split_command[2]));
					case "forward":
						line_number_add_amount = Std.parseInt(split_command[2]);

					default:
						Sys.println("[WARNING] Unknown input for command: \"go\" : " + split_command[2]);
				}

			default:
				Sys.println("[WARNING] Unimplemented command: " + split_command[0]);
		}

		line_number += line_number_add_amount;

		if ((line_number - 1) == commands.length)
		{
			Application.current.window.alert("The program is out of executable program lines. Goodbye.", "Overflow prevention");
			Sys.exit(0);
		}
	}
}

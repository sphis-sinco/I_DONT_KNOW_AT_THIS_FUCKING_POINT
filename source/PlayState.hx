package;

import flixel.text.FlxText;
import commands.AtCommand;
import commands.GoCommand;
import commands.EchoCommand;
import haxe.Json;
import lime.app.Application;
import sys.FileSystem;
import sys.io.File;
import flixel.FlxState;

using StringTools;

class PlayState extends FlxState
{
	var starting_point:String = '';

	public static var instance:PlayState;

	override public function new()
	{
		super();

		if (instance != null)
			instance = null;
		instance = this;

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

	public var filepath:String = '';
	public var commands:Array<String> = [];

	public var variables:Map<String, Dynamic> = [];
	public var settable_variables:Array<String> = [];

	public var line_number:Int = 0;

	public function setVariable(name:String, value:Dynamic, ?settable:Bool = true)
	{
		if (variables.exists(name) && !settable_variables.contains(name))
		{
			Sys.println("[WARNING] Cannot set variable set to non_settable: " + name);
			return;
		}

		variables.set(name, value);

		if (settable)
			settable_variables.push(name);
		else if (!settable && settable_variables.contains(name))
			settable_variables.remove(name);
	}

	override function create()
	{
		super.create();

		variables.clear();
		variables.set('version', Application.current.meta.get('version'));
		add(new FlxText(2, 2, 0, Application.current.meta.get('version'), 16));

		filepath = starting_point;
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

		if (command.startsWith(';'))
		{
			line_number += 1;
			return;
		}

		switch (split_command[0])
		{
			case "echo":
				new EchoCommand(command).parse();

			case "go":
				var command:GoCommand = new GoCommand(command);
				command.parse();
				line_number_add_amount = Std.parseInt(command.value);

			case "@":
				var command:AtCommand = new AtCommand(command);
				command.parse();

			case '':

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

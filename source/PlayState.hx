package;

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

		trace('Valid starting point!');
	}

	var commands:Array<String> = [];

	override function create()
	{
		super.create();

		var json_file = Json.parse(File.getContent(starting_point));

		commands = cast json_file.commands;
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}

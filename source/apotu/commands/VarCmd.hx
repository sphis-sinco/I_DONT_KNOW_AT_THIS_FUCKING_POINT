package apotu.commands;

class VarCmd extends VariableCmd
{
	override public function new()
	{
		super();
		this.prefix = 'var';
	}
}

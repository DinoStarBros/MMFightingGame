extends Node
class_name P1Inputs

@onready var sspawner: StuffSpawner = %StuffSpawner

const diag : float = sqrt(2)/2

var input_dir : Vector2:
	set(value):
		if value == input_dir: return
		input_dir = value
		spawn_dir(input_dir)

func spawn_dir(dir: Vector2) -> void:
	match dir:
		Vector2.ZERO:
			sspawner.spawn_command(Command.CommandTypes.NEUTRAL)
		Vector2.RIGHT:
			sspawner.spawn_command(Command.CommandTypes.RIGHT)
		Vector2.UP:
			sspawner.spawn_command(Command.CommandTypes.UP)
		Vector2.LEFT:
			sspawner.spawn_command(Command.CommandTypes.LEFT)
		Vector2.DOWN:
			sspawner.spawn_command(Command.CommandTypes.DOWN)
		
		Vector2(diag, -diag):
			sspawner.spawn_command(Command.CommandTypes.UP_RIGHT)
		Vector2(-diag, -diag):
			sspawner.spawn_command(Command.CommandTypes.UP_LEFT)
		Vector2(-diag, diag):
			sspawner.spawn_command(Command.CommandTypes.DOWN_LEFT)
		Vector2(diag, diag):
			sspawner.spawn_command(Command.CommandTypes.DOWN_RIGHT)

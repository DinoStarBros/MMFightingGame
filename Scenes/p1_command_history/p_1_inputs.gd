extends Node
class_name P1Inputs

@onready var sspawner: P1StuffSpawner = %P1StuffSpawner

const diag : float = sqrt(2)/2

var inputack_count_true : int
var input_dir : Vector2:
	set(value):
		if input_dir == value: return
		input_dir = value
		spawn_dir(input_dir)

var input_attack : Array = [false, false, false, false]:
	set(value):
		if input_attack == value: return
		input_attack = value

func spawn_dir(dir: Vector2) -> void:
	match dir:
		Vector2.ZERO:
			sspawner.spawn_dir_command(Command.CommandTypes.NEUTRAL)
		Vector2.RIGHT:
			sspawner.spawn_dir_command(Command.CommandTypes.RIGHT)
		Vector2.UP:
			sspawner.spawn_dir_command(Command.CommandTypes.UP)
		Vector2.LEFT:
			sspawner.spawn_dir_command(Command.CommandTypes.LEFT)
		Vector2.DOWN:
			sspawner.spawn_dir_command(Command.CommandTypes.DOWN)
		
		Vector2(diag, -diag):
			sspawner.spawn_dir_command(Command.CommandTypes.UP_RIGHT)
		Vector2(-diag, -diag):
			sspawner.spawn_dir_command(Command.CommandTypes.UP_LEFT)
		Vector2(-diag, diag):
			sspawner.spawn_dir_command(Command.CommandTypes.DOWN_LEFT)
		Vector2(diag, diag):
			sspawner.spawn_dir_command(Command.CommandTypes.DOWN_RIGHT)

#func spawn_attack(inp_atk: Array) -> void:
	##if input_attack.count(true) == inp_atk.count(true): return
	##if input_attack == inp_atk: return
	#print(input_attack)
	#input_attack = inp_atk
	#print(input_attack)

extends Node
class_name P1Inputs

@onready var sspawner: P1StuffSpawner = %P1StuffSpawner

const diag : float = sqrt(2)/2

var input_dir : Vector2:
	set(value):
		if input_dir == value: return
		input_dir = value
		spawn_dir(input_dir)

var input_attack : Array[bool] = [false, false, false, false]:
	set(value):
		if input_attack == value: return
		input_attack = value
		_spawn_attack(input_attack)

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

func _spawn_attack(input: Array):
	match input:

		[false, false, false, false]:
			sspawner.spawn_attack_command(Command.CommandTypes.NEUTRAL)

		[true, false, false, false]:
			sspawner.spawn_attack_command(Command.CommandTypes.ONE)
		[false, true, false, false]:
			sspawner.spawn_attack_command(Command.CommandTypes.TWO)
		[false, false, true, false]:
			sspawner.spawn_attack_command(Command.CommandTypes.THREE)
		[false, false, false, true]:
			sspawner.spawn_attack_command(Command.CommandTypes.FOUR)

		[true, true, false, false]:
			sspawner.spawn_attack_command(Command.CommandTypes.ONE_TWO)
		[false, true, true, false]:
			sspawner.spawn_attack_command(Command.CommandTypes.TWO_THREE)
		[false, false, true, true]:
			sspawner.spawn_attack_command(Command.CommandTypes.THREE_FOUR)
		[true, false, false, true]:
			sspawner.spawn_attack_command(Command.CommandTypes.ONE_FOUR)

		[true, false, true, false]:
			sspawner.spawn_attack_command(Command.CommandTypes.ONE_THREE)
		[false, true, false, true]:
			sspawner.spawn_attack_command(Command.CommandTypes.TWO_FOUR)

		[true, true, true, false]:
			sspawner.spawn_attack_command(Command.CommandTypes.ONE_TWO_THREE)
		[false, true, true, true]:
			sspawner.spawn_attack_command(Command.CommandTypes.TWO_THREE_FOUR)
		[true, false, true, true]:
			sspawner.spawn_attack_command(Command.CommandTypes.THREE_FOUR_ONE)
		[true, true, false, true]:
			sspawner.spawn_attack_command(Command.CommandTypes.ONE_FOUR_TWO)

		[true, true, true, true]:
			sspawner.spawn_attack_command(Command.CommandTypes.ALL_FOUR)

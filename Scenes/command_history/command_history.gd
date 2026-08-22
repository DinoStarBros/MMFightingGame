extends Node2D
class_name CommandHistory

@export var input_reader : InputReader

@onready var p1_stuff_spawner: P1StuffSpawner = %P1StuffSpawner
@onready var p1_inputs: P1Inputs = %P1Inputs

var input_attack : Array[bool] = [false, false, false, false]:
	set(value):
		input_attack = value
		p1_inputs.input_attack = input_attack
var dir_command_history : Array
var atk_command_history : Array
var current_atk : int
var current_dir : int
var parent_character : Character
## True = Player1, False = Player2
var is_player_1 : bool = true 

const INPUT_LIMIT : int = 15

func _ready() -> void:
	parent_character = input_reader.parent_character
	is_player_1 = parent_character.character_p1_or_p2 == Character.CharacterP1orP2.P1
	
	
	for n in (1280.0/16.0):
		p1_stuff_spawner.spawn_belt_box(n * -16, 0)
		p1_stuff_spawner.spawn_belt_box(n * -16, 32)
	
	for n in INPUT_LIMIT:
		dir_command_history.append(0)
		atk_command_history.append(0)

func _physics_process(delta: float) -> void:
	
	if is_player_1:
		p1_inputs.input_dir = Input.get_vector(
			"p1left", "p1right", "p1up", "p1down"
		)
	else:
		p1_inputs.input_dir = Input.get_vector(
			"p2left", "p2right", "p2up", "p2down"
		)
	
	if is_player_1:
		input_attack = [
			Input.is_action_pressed("p1-1"),
			Input.is_action_pressed("p1-2"),
			Input.is_action_pressed("p1-3"),
			Input.is_action_pressed("p1-4")
		]
	else:
		input_attack = [
			Input.is_action_pressed("p2-1"),
			Input.is_action_pressed("p2-2"),
			Input.is_action_pressed("p2-3"),
			Input.is_action_pressed("p2-4")
		]
	
	%dir_history.text = str(
		dir_command_history, 
		)
	
	%atk_history.text = str(
		atk_command_history,
		)
	
	if dir_command_history.size() >= INPUT_LIMIT:
		current_dir = dir_command_history[INPUT_LIMIT - 1]
		%current_dir.text = str(current_dir)
	
	if atk_command_history.size() >= INPUT_LIMIT:
		current_atk = atk_command_history[INPUT_LIMIT - 1]
		%current_atk.text = str(current_atk)
	
	if dir_command_history.size() >= INPUT_LIMIT:
		dir_command_history.remove_at(0)
	if atk_command_history.size() >= INPUT_LIMIT:
		atk_command_history.remove_at(0)

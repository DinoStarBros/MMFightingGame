extends Node2D
class_name P1CommandHistory

@onready var sspawner: P1StuffSpawner = %P1StuffSpawner
@onready var p1_inputs: P1Inputs = %P1Inputs

var input_attack : Array[bool] = [false, false, false, false]:
	set(value):
		input_attack = value
		p1_inputs.input_attack = input_attack
var dir_command_history : Array
var atk_command_history : Array
var current_atk : int
var current_dir : int

const INPUT_LIMIT : int = 15

func _ready() -> void:
	for n in (1280.0/16.0):
		sspawner.spawn_belt_box(n * -16, 0)
		sspawner.spawn_belt_box(n * -16, 32)
	
	for n in INPUT_LIMIT:
		dir_command_history.append(0)
		atk_command_history.append(0)

func _physics_process(delta: float) -> void:
	
	p1_inputs.input_dir = Input.get_vector(
		"p1left", "p1right", "p1up", "p1down"
	)
	
	input_attack = [
		Input.is_action_pressed("p1-1"),
		Input.is_action_pressed("p1-2"),
		Input.is_action_pressed("p1-3"),
		Input.is_action_pressed("p1-4")
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

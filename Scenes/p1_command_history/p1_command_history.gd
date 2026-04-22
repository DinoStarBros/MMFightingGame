extends Node2D
class_name P1CommandHistory

@onready var sspawner: P1StuffSpawner = %P1StuffSpawner
@onready var p1_inputs: P1Inputs = %P1Inputs

var input_attack : Array[bool] = [false, false, false, false]:
	set(value):
		input_attack = value
		p1_inputs.input_attack = input_attack
var command_history


func _ready() -> void:
	for n in (1280.0/16.0):
		sspawner.spawn_belt_box(n * -16, 0)
		sspawner.spawn_belt_box(n * -16, 32)

func _physics_process(delta: float) -> void:
	
	p1_inputs.input_dir = Input.get_vector(
		"p1left", "p1right", "p1up", "p1down"
	)
	
	#input_attack[0] = Input.is_action_pressed("p1-1")
	#input_attack[1] = Input.is_action_pressed("p1-2")
	#input_attack[2] = Input.is_action_pressed("p1-3")
	#input_attack[3] = Input.is_action_pressed("p1-4")
	
	input_attack = [
		Input.is_action_pressed("p1-1"),
		Input.is_action_pressed("p1-2"),
		Input.is_action_pressed("p1-3"),
		Input.is_action_pressed("p1-4")
	]

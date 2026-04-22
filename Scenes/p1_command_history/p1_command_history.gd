extends Node2D
class_name P1CommandHistory

@onready var sspawner: StuffSpawner = %StuffSpawner
@onready var p1_inputs: P1Inputs = %P1Inputs

var command_history

func _ready() -> void:
	for n in (1280.0/16.0):
		sspawner.spawn_belt_box(n * -16, 0)
		sspawner.spawn_belt_box(n * -16, 32)

func _input(event: InputEvent) -> void:
	
	p1_inputs.input_dir = Input.get_vector(
		"p1left", "p1right", "p1up", "p1down"
	)

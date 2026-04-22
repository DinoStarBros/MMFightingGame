extends Node2D
class_name CommandHistory

@onready var sspawner: StuffSpawner = %StuffSpawner

func _ready() -> void:
	for n in (1280.0/16.0):
		sspawner.spawn_belt_box(n * -16)

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("p1right"):
		sspawner.spawn_command(Command.CommandTypes.RIGHT)
	if Input.is_action_just_pressed("p1up"):
		sspawner.spawn_command(Command.CommandTypes.UP)
	if Input.is_action_just_pressed("p1down"):
		sspawner.spawn_command(Command.CommandTypes.DOWN)
	if Input.is_action_just_pressed("p1left"):
		sspawner.spawn_command(Command.CommandTypes.LEFT)

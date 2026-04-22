extends Node2D
class_name CommandHistory

@onready var command_start_point: Marker2D = %command_start_point

var command_scn : PackedScene = preload("res://Scenes/command/command.tscn")

func _ready() -> void:
	pass

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("p1right"):
		_spawn_command(Command.CommandTypes.RIGHT)
	if Input.is_action_just_pressed("p1up"):
		_spawn_command(Command.CommandTypes.UP)
	if Input.is_action_just_pressed("p1down"):
		_spawn_command(Command.CommandTypes.DOWN)
	if Input.is_action_just_pressed("p1left"):
		_spawn_command(Command.CommandTypes.LEFT)
	

func _spawn_command(command_type: Command.CommandTypes) -> void:
	var command : Command = command_scn.instantiate()
	command.command_type = command_type
	add_child(command)
	command.global_position = command_start_point.global_position

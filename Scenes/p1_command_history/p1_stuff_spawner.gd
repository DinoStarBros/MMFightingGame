extends Node
class_name P1StuffSpawner

@onready var command_start_point: Marker2D = %dir_command_start_point
@onready var command_history : P1CommandHistory = get_parent()

const command_scn : PackedScene = preload("res://Scenes/p1_command/p1_command.tscn")
const belt_box_scn : PackedScene = preload("res://Scenes/p1_command/p1_belt_box.tscn")

func spawn_dir_command(command_type: Command.CommandTypes) -> void:
	GlobalSignal.TickInputP1.emit()
	
	var command : Command = command_scn.instantiate()
	command.command_type = command_type
	add_child(command)
	command.global_position = command_start_point.global_position
	
	command_history.dir_command_history.append(command_type)

func spawn_attack_command(command_type: Command.CommandTypes) -> void:
	GlobalSignal.TickInputP1.emit()
	
	var command : Command = command_scn.instantiate()
	command.command_type = command_type
	add_child(command)
	command.global_position = command_start_point.global_position
	command.global_position.y += 32
	
	command_history.atk_command_history.append(command_type)

func spawn_belt_box(posx : float, y_offset: float) -> void:
	var belt_box : Sprite2D = belt_box_scn.instantiate()
	add_child(belt_box)
	belt_box.global_position.x = posx + command_start_point.global_position.x
	belt_box.global_position.y = command_start_point.global_position.y + y_offset

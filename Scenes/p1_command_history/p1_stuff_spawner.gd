extends Node
class_name P1StuffSpawner

@onready var command_start_point: Marker2D = %dir_command_start_point

const command_scn : PackedScene = preload("uid://cxvup7qmlxmko")
const belt_box_scn : PackedScene = preload("uid://m6ny2ssxdku6")

func spawn_dir_command(command_type: Command.CommandTypes) -> void:
	GlobalSignal.TickInputP1.emit()
	
	var command : Command = command_scn.instantiate()
	command.command_type = command_type
	add_child(command)
	command.global_position = command_start_point.global_position

func spawn_attack_command(command_type: Command.CommandTypes) -> void:
	GlobalSignal.TickInputP1.emit()
	
	var command : Command = command_scn.instantiate()
	command.command_type = command_type
	add_child(command)
	command.global_position = command_start_point.global_position
	command.global_position.y += 32

func spawn_belt_box(posx : float, y_offset: float) -> void:
	var belt_box : Sprite2D = belt_box_scn.instantiate()
	add_child(belt_box)
	belt_box.global_position.x = posx + command_start_point.global_position.x
	belt_box.global_position.y = command_start_point.global_position.y + y_offset

extends Node2D
class_name InputReader

@export var command_history_node : P1CommandHistory

var atk_history : Array
var dir_history : Array

var current_atk : int 
var current_dir : int

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	atk_history = command_history_node.atk_command_history
	dir_history = command_history_node.dir_command_history
	
	current_atk = command_history_node.current_atk
	current_dir = command_history_node.current_dir

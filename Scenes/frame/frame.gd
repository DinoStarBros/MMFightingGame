extends Node2D
class_name Frame

var is_current_frame : bool = false

func _physics_process(delta: float) -> void:
	visible = is_current_frame

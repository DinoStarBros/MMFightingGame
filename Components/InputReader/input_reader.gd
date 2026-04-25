extends Node2D
class_name InputReader

@export var command_history_node : P1CommandHistory

var dir_history : Array:
	set(value):
		dir_history = value
var atk_history : Array:
	set(value):
		atk_history = value

var dir_frames_length_history : Array
var atk_frames_length_history : Array

var current_atk : int:
	set(value):
		if current_atk == value: return
		current_atk = value
		atk_frames_length_history.append(frames_since_last_atk_input)
		await get_tree().process_frame
		frames_since_last_atk_input = 0
var current_dir : int:
	set(value):
		if current_dir == value: return
		current_dir = value
		dir_frames_length_history.append(frames_since_last_dir_input)
		await get_tree().process_frame
		frames_since_last_dir_input = 0

var input_limit : int

var frames_since_last_dir_input : int:
	set(value):
		frames_since_last_dir_input = value
		%frame_since_dir.text = str(frames_since_last_dir_input)
var frames_since_last_atk_input : int:
	set(value):
		frames_since_last_atk_input = value
		%frame_since_atk.text = str(frames_since_last_atk_input)

func _ready() -> void:
	input_limit = command_history_node.INPUT_LIMIT
	
	for n in input_limit:
		dir_frames_length_history.append(0)
		atk_frames_length_history.append(0)

func _physics_process(delta: float) -> void:
	
	atk_history = command_history_node.atk_command_history
	dir_history = command_history_node.dir_command_history
	
	current_atk = command_history_node.current_atk
	current_dir = command_history_node.current_dir
	
	%atk_frames_since_history.text = str(atk_frames_length_history)
	%dir_frames_since_history.text = str(dir_frames_length_history)
	
	if dir_frames_length_history.size() >= input_limit:
		dir_frames_length_history.remove_at(0)
	if atk_frames_length_history.size() >= input_limit:
		atk_frames_length_history.remove_at(0)
	
	frames_since_last_dir_input += 1
	frames_since_last_atk_input += 1

var just_atk : bool = false
var last_frame_pressed : bool = false
func just_atk_pressed(attack : Command.CommandTypes) -> bool:
	
	var is_pressed : bool = current_atk == Command.CommandTypes.ONE
	var is_just_pressed : bool = is_pressed and not last_frame_pressed
	last_frame_pressed = is_pressed
	return is_just_pressed

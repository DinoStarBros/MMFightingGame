extends Character
class_name JohnFight

var dir_history : Array
var atk_history : Array
var input_limit : int
var frames_since_last_dir_input : int
var frames_since_last_atk_input : int
var dir_frames_length_history : Array
var atk_frames_length_history : Array

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	move_and_slide()
	
	dir_history = input_reader.dir_history
	atk_history = input_reader.atk_history
	input_limit = input_reader.input_limit
	frames_since_last_dir_input = input_reader.frames_since_last_dir_input
	frames_since_last_atk_input = input_reader.frames_since_last_atk_input
	dir_frames_length_history = input_reader.dir_frames_length_history
	atk_frames_length_history = input_reader.atk_frames_length_history

	
	if not is_on_floor():
		velocity.y += Global.GRAVITY * delta

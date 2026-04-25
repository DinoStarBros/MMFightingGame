extends Character
class_name JohnFight

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
		if velocity.y >= 0: # Falling
			velocity.y += Global.GRAVITY * delta * 1.5
		else: # Jumping
			velocity.y += Global.GRAVITY * delta * 1.2

extends State

func enter() -> void:
	p.velocity.x = 0
	p.character_anim.idle()

func physics_update(delta: float) -> void:
	if p.input_reader.current_dir == Command.CommandTypes.RIGHT:
		_forward_dir_pressed_handling(delta)
	
	if p.input_reader.current_dir == Command.CommandTypes.LEFT:
		_back_dir_pressed_handling(delta)

func _forward_dir_pressed_handling(delta: float) -> void:
	
	if (
	p.dir_frames_length_history[p.input_limit - 3] <= 10
	and
	p.dir_frames_length_history[p.input_limit - 2] <= 10
	and
	p.frames_since_last_dir_input <= 10
	and
	p.dir_history[p.input_limit - 2] == Command.CommandTypes.RIGHT
	and
	p.dir_history[p.input_limit - 3] == Command.CommandTypes.NEUTRAL
	and
	p.dir_history[p.input_limit - 4] == Command.CommandTypes.RIGHT
	):
		p.velocity.x = p.forward_dash_speed
		state_machine.change_state("ForwardDash")
	
	else:
	
		p.velocity.x = p.forward_move_speed
		state_machine.change_state("Forward")

func _back_dir_pressed_handling(delta: float) -> void:
	
	if (
	p.dir_frames_length_history[p.input_limit - 3] <= 10
	and
	p.dir_frames_length_history[p.input_limit - 2] <= 10
	and
	p.frames_since_last_dir_input <= 10
	and
	p.dir_history[p.input_limit - 2] == Command.CommandTypes.LEFT
	and
	p.dir_history[p.input_limit - 3] == Command.CommandTypes.NEUTRAL
	and
	p.dir_history[p.input_limit - 4] == Command.CommandTypes.LEFT
	):
		p.velocity.x = p.backward_dash_speed
		state_machine.change_state("BackDash")
	
	else:
	
		p.velocity.x = p.backward_move_speed
		state_machine.change_state("Back")

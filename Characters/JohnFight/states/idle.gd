extends State

func enter() -> void:
	p.velocity.x = 0
	p.character_anim.idle()

func physics_update(delta: float) -> void:
	if p.input_reader.current_dir == Command.CommandTypes.RIGHT:
		forward_dir_pressed_handling(delta)
	
	if p.input_reader.current_dir == Command.CommandTypes.LEFT:
		p.velocity.x = p.backward_move_speed
		state_machine.change_state("Back")

func forward_dir_pressed_handling(delta: float) -> void:
	var dir_history : Array = p.input_reader.dir_history
	var atk_history : Array = p.input_reader.atk_history
	
	if (
	dir_history[p.input_reader.input_limit - 2] == Command.CommandTypes.RIGHT
	and
	dir_history[p.input_reader.input_limit - 3] == Command.CommandTypes.NEUTRAL
	and
	dir_history[p.input_reader.input_limit - 4] == Command.CommandTypes.RIGHT
	):
		
		p.velocity.x = p.forward_dash_speed
		state_machine.change_state("ForwardDash")
	
	else:
	
		p.velocity.x = p.forward_move_speed
		state_machine.change_state("Forward")

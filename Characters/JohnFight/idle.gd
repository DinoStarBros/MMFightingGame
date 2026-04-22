extends State

func enter() -> void:
	p.velocity.x = 0

func physics_update(delta: float) -> void:
	if p.input_reader.current_dir == Command.CommandTypes.RIGHT:
		p.velocity.x = p.forward_move_speed
		state_machine.change_state("Forward")
	
	if p.input_reader.current_dir == Command.CommandTypes.LEFT:
		p.velocity.x = p.backward_move_speed
		state_machine.change_state("Back")

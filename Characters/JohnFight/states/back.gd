extends State

func enter() -> void:
	p.character_anim.walk_backward()

func physics_update(delta: float) -> void:
	if p.input_reader.current_dir == Command.CommandTypes.LEFT:
		p.velocity.x = p.backward_move_speed
	else:
		state_machine.change_state("idle")

extends State

func enter() -> void:
	p.character_anim.walk_forward()

func physics_update(delta: float) -> void:
	if p.input_reader.current_dir == Command.CommandTypes.RIGHT:
		p.velocity.x = p.forward_move_speed
	else:
		state_machine.change_state("idle")

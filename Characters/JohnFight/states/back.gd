extends State

func enter() -> void:
	p.character_anim.walk_backward()

func physics_update(delta: float) -> void:
	p.grounded_attacks_handle()
	
	if DirectionInput.backward_pressed(p):
		p.velocity.x = -p.backward_move_speed * p.current_side_facing
	else:
		state_machine.change_state("idle")

extends State

func enter() -> void:
	p.character_anim.walk_forward()

func physics_update(delta: float) -> void:
	
	p.grounded_attacks_handle()
	
	if DirectionInput.forward_pressed(p):
		p.velocity.x = p.forward_move_speed * p.current_side_facing
	else:
		state_machine.change_state("idle")

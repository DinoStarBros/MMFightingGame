extends State

func enter() -> void:
	frames = 0
	
	p.velocity.x = p.forward_dash_speed
	p.character_anim.forward_dash()

func physics_update(delta: float) -> void:
	p.velocity.x *= p.f_dash_friction
	
	frames += 1
	if frames >= p.f_dash_total_frames:
		state_machine.change_state("Idle")

extends State

func enter(extra_data: Dictionary = {}) -> void:
	frames_elapsed = 0
	
	p.velocity.x = p.forward_dash_speed * p.current_side_facing
	p.character_anim.forward_dash()

func physics_update(delta: float) -> void:
	
	p.velocity.x *= p.f_dash_friction
	
	frames_elapsed += 1
	if frames_elapsed >= p.f_dash_total_frames:
		state_machine.change_state("Idle")

extends State


var frames : float = 0

func enter() -> void:
	frames = 0
	
	p.velocity.x = p.backward_dash_speed
	p.character_anim.back_dash()

func physics_update(delta: float) -> void:
	p.velocity.x *= p.f_dash_friction
	
	frames += 1
	if frames >= p.b_dash_total_frames:
		state_machine.change_state("Idle")

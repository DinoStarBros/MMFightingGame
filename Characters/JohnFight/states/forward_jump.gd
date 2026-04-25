extends State

func enter() -> void:
	p.character_anim.jump()
	p.velocity.y = -p.jump_speed

func physics_update(delta: float) -> void:
	
	if p.velocity.y > 0:
		state_machine.change_state("Fall")

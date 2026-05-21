extends State

func enter() -> void:
	p.character_anim.jump()
	p.velocity.y = -p.jump_speed
	
	frames = 0

func physics_update(delta: float) -> void:
	frames += 1
	
	if p.velocity.y > 0:
		print(frames)
		state_machine.change_state("Fall")

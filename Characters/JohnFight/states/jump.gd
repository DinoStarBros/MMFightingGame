extends State

func enter() -> void:
	p.character_anim.jump()
	p.velocity.y = -p.jump_speed
	
	frames_elapsed = 0

func physics_update(delta: float) -> void:
	frames_elapsed += 1
	
	if p.velocity.y > 0:
		#print(frames_elapsed)
		state_machine.change_state("Fall")

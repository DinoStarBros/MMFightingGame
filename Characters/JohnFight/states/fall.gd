extends State

func enter() -> void:
	p.character_anim.fall()
	
	frames = 0
	
	#print(p.global_position.y)
	# The peak is fucking 283.whatever bullshit decimals follow
	# 283.590545654297

func physics_update(delta: float) -> void:
	frames += 1
	
	if p.is_on_floor():
		#print(frames)
		state_machine.change_state("LandingRecovery")

extends State

func enter() -> void:
	p.character_anim.fall()
	
	frames_elapsed = 0
	
	#print(p.global_position.y)
	# The peak is fucking 283.whatever bullshit decimals follow
	# 283.590545654297

func physics_update(delta: float) -> void:
	frames_elapsed += 1
	
	if p.is_on_floor():
		#print(frames_elapsed)
		state_machine.change_state("LandingRecovery")

extends State

func enter() -> void:
	frames = 0

func physics_update(delta: float) -> void:
	frames += 1
	
	if frames >= p.landing_recovery_frames:
		#print(frames)
		state_machine.change_state("Idle")

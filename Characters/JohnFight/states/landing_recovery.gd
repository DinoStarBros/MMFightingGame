extends State

func enter() -> void:
	frames_elapsed = 0

func physics_update(delta: float) -> void:
	frames_elapsed += 1
	
	if frames_elapsed >= p.landing_recovery_frames:
		#print(frames)
		state_machine.change_state("Idle")

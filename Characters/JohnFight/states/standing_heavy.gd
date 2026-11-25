extends State

func enter() -> void:
	frames_elapsed = 0
	
	p.character_anim.standing_heavy()
	what_was_pressed = Command.CommandTypes.NEUTRAL

func physics_update(delta: float) -> void:
	
	p.apply_friction()
	frames_elapsed += 1
	
	if frames_elapsed >= p.standing_h_total_frames:
		state_machine.change_state("Idle")

func exit() -> void:
	what_was_pressed = Command.CommandTypes.NEUTRAL

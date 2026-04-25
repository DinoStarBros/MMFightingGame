extends State

func enter() -> void:
	frames = 0
	p.velocity.x = 0
	
	p.character_anim.standing_heavy()
	what_was_pressed = Command.CommandTypes.NEUTRAL
	allow_buffer = false

func physics_update(delta: float) -> void:
	frames += 1
	
	allow_buffer = frames >= p.standing_h_recovery_start_frame
	
	if allow_buffer:
		pass
	
	if frames >= p.standing_h_total_frames:
		state_machine.change_state("Idle")

func exit() -> void:
	what_was_pressed = Command.CommandTypes.NEUTRAL

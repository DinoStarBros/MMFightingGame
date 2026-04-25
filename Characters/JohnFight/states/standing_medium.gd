extends State

func enter() -> void:
	frames = 0
	p.velocity.x = 0
	
	p.character_anim.standing_medium()
	what_was_pressed = Command.CommandTypes.NEUTRAL
	allow_buffer = false

func physics_update(delta: float) -> void:
	frames += 1
	
	allow_buffer = frames >= p.standing_m_recovery_start_frame
	
	if allow_buffer:
		if p.input_reader.just_atk_pressed(Command.CommandTypes.THREE):
			what_was_pressed = Command.CommandTypes.THREE
	
	if frames >= p.standing_m_total_frames:
		if (
			what_was_pressed == Command.CommandTypes.THREE
			):
			
			state_machine.change_state("StandingHeavy")
			
		else:
			
			state_machine.change_state("Idle")

func exit() -> void:
	what_was_pressed = Command.CommandTypes.NEUTRAL

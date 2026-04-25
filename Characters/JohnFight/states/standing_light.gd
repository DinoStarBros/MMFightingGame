extends State

func enter() -> void:
	frames = 0
	p.velocity.x = 0
	
	p.character_anim.standing_light()
	what_was_pressed = Command.CommandTypes.NEUTRAL
	allow_buffer = false

func update(delta: float) -> void:
	if p.input_reader.just_atk_pressed(Command.CommandTypes.TWO):
		what_was_pressed = Command.CommandTypes.TWO
	if p.input_reader.just_atk_pressed(Command.CommandTypes.THREE):
		what_was_pressed = Command.CommandTypes.THREE

func physics_update(delta: float) -> void:
	frames += 1
	
	if frames >= p.standing_l_recovery_start_frame:
		if what_was_pressed == Command.CommandTypes.TWO:
			state_machine.change_state("StandingMedium")
		elif what_was_pressed == Command.CommandTypes.THREE:
			state_machine.change_state("StandingHeavy")
	
	if frames >= p.standing_l_total_frames:
		state_machine.change_state("Idle")

func exit() -> void:
	what_was_pressed = Command.CommandTypes.NEUTRAL

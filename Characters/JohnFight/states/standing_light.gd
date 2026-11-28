extends State

func enter(extra_data: Dictionary = {}) -> void:
	frames_elapsed = 0
	
	p.character_anim.standing_light()
	what_was_pressed = Command.CommandTypes.NEUTRAL

func update(delta: float) -> void:
	if p.input_reader.just_atk_pressed(Command.CommandTypes.TWO):
		what_was_pressed = Command.CommandTypes.TWO
	if p.input_reader.just_atk_pressed(Command.CommandTypes.THREE):
		what_was_pressed = Command.CommandTypes.THREE

func physics_update(delta: float) -> void:
	p.apply_friction()
	
	frames_elapsed += 1
	
	if frames_elapsed >= p.attacks_moveset["StandingL"].recovery_start_frame:
		if what_was_pressed == Command.CommandTypes.TWO:
			state_machine.change_state("StandingMedium")
		elif what_was_pressed == Command.CommandTypes.THREE:
			state_machine.change_state("StandingHeavy")
	
	if frames_elapsed >= p.attacks_moveset["StandingL"].total_frames:
		state_machine.change_state("Idle")

func exit() -> void:
	what_was_pressed = Command.CommandTypes.NEUTRAL

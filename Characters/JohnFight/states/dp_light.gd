extends State

func enter() -> void:
	frames_elapsed = 0
	
	p.character_anim.dp_light()
	what_was_pressed = Command.CommandTypes.NEUTRAL

func physics_update(delta: float) -> void:
	p.apply_friction()
	frames_elapsed += 1
	
	if frames_elapsed >= p.dp_l_startup:
		p.velocity.y = -2000
		p.velocity.x = p.current_side_facing * 500
	
	if frames_elapsed >= p.dp_l_frame_total:
		if p.is_on_floor():
			state_machine.change_state("Idle")
		else:
			state_machine.change_state("Fall")

func exit() -> void:
	what_was_pressed = Command.CommandTypes.NEUTRAL
	p.velocity.y *= 0.5

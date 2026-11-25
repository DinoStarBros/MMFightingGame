extends State

func enter() -> void:
	frames = 0
	
	#p.character_anim.qcf_light()
	what_was_pressed = Command.CommandTypes.NEUTRAL

func physics_update(delta: float) -> void:
	p.apply_friction()
	frames += 1
	
	if frames >= p.dp_l_frame_total:
		state_machine.change_state("Idle")
	

func exit() -> void:
	what_was_pressed = Command.CommandTypes.NEUTRAL

extends State

var frames : float = 0

func enter() -> void:
	frames = 0
	p.velocity.x = 0
	
	p.character_anim.standing_light()

func physics_update(delta: float) -> void:
	
	frames += 1
	if frames >= p.standing_l_total_frames:
		
		if (
			p.atk_history[p.input_limit - 2] == Command.CommandTypes.NEUTRAL ## Last input
			and
			p.atk_history[p.input_limit - 3] == Command.CommandTypes.ONE ## 2nd to last
			and
			p.atk_history[p.input_limit - 4] == Command.CommandTypes.NEUTRAL ## 3rd to last
			and
			p.atk_history[p.input_limit - 5] == Command.CommandTypes.ONE ## 4th to last
			and
			p.frames_since_last_atk_input <= p.standing_l_total_frames
			
			):
			
			state_machine.change_state("StandingLight")
			
			
		else:
			
			state_machine.change_state("Idle")

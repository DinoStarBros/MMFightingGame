extends State

var frames : float = 0
var what_was_pressed : Command.CommandTypes
var allow_buffer : bool = false

func enter() -> void:
	frames = 0
	p.velocity.x = 0
	
	p.character_anim.standing_light()
	what_was_pressed = Command.CommandTypes.NEUTRAL
	allow_buffer = false

func physics_update(delta: float) -> void:
	frames += 1
	
	allow_buffer = frames >= 7
	
	if allow_buffer:
		if p.input_reader.just_atk_pressed(Command.CommandTypes.ONE):
			what_was_pressed = Command.CommandTypes.ONE
	
	if frames >= p.standing_l_total_frames:
		if (
			what_was_pressed == Command.CommandTypes.ONE
			and
			p.atk_history[p.input_limit - 2] == Command.CommandTypes.NEUTRAL ## Last input
			and
			p.atk_history[p.input_limit - 3] == Command.CommandTypes.ONE ## 2nd to last
			#and
			#p.input_reader
			):
			
			state_machine.change_state("StandingLight")
			
		else:
			
			state_machine.change_state("Idle")

func exit() -> void:
	what_was_pressed = Command.CommandTypes.NEUTRAL

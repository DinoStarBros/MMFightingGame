extends DirectionInput
## For motion inputs SPECIFICALLY
## like Quuarter Circle Forwards, DPs, etc.
## So that the DirectionInputScript wont be bloated as helll
class_name MotionInput

static func quarter_circle_forward(p: Character) -> bool:
	if p.dir_history.size() == 0:
		return false
	
	if p.current_side_facing == 1:
		
		return (
		# Holding down right
		dir_pressed(p, Command.CommandTypes.RIGHT)
		and
		p.dir_history[p.input_limit - 3] == Command.CommandTypes.DOWN_RIGHT
		and
		p.dir_history[p.input_limit - 4] == Command.CommandTypes.DOWN
		and
		p.frames_since_last_dir_input <= MOTION_INPUT_BUFFER_WINDOW
			) or (
		# Pressed right then neutral
		dir_pressed(p, Command.CommandTypes.NEUTRAL)
		and
		p.dir_history[p.input_limit - 3] == Command.CommandTypes.RIGHT
		and
		p.dir_history[p.input_limit - 4] == Command.CommandTypes.DOWN_RIGHT
		and
		p.dir_history[p.input_limit - 5] == Command.CommandTypes.DOWN
		and
		p.frames_since_last_dir_input <= MOTION_INPUT_BUFFER_WINDOW
		)
	else:
		return (
		# Holding left
		dir_pressed(p, Command.CommandTypes.LEFT)
		and
		p.dir_history[p.input_limit - 3] == Command.CommandTypes.DOWN_LEFT
		and
		p.dir_history[p.input_limit - 4] == Command.CommandTypes.DOWN
		and
		p.frames_since_last_dir_input <= MOTION_INPUT_BUFFER_WINDOW
			) or (
		# Pressed left then neutral
		dir_pressed(p, Command.CommandTypes.NEUTRAL)
		and
		p.dir_history[p.input_limit - 3] == Command.CommandTypes.LEFT
		and
		p.dir_history[p.input_limit - 4] == Command.CommandTypes.DOWN_LEFT
		and
		p.dir_history[p.input_limit - 5] == Command.CommandTypes.DOWN
		and
		p.frames_since_last_dir_input <= MOTION_INPUT_BUFFER_WINDOW
		)

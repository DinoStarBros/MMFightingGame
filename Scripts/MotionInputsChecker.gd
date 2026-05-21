extends InputCheckerScript
## Checker for motion & directional inputs
## so that I don't have to fucking copy-paste the same shit
## everywhere
class_name DirectionInput

static func forward_dash(p: Character) -> bool:
	return (
	p.dir_frames_length_history[p.input_limit - 3] <= DASH_TAP_WINDOW
	and
	p.dir_frames_length_history[p.input_limit - 2] <= DASH_TAP_WINDOW
	and
	p.frames_since_last_dir_input <= DASH_TAP_WINDOW
	and
	p.dir_history[p.input_limit - 2] == Command.CommandTypes.RIGHT
	and
	p.dir_history[p.input_limit - 3] == Command.CommandTypes.NEUTRAL
	and
	p.dir_history[p.input_limit - 4] == Command.CommandTypes.RIGHT
	)

static func back_dash(p: Character) -> bool:
	return (
	p.dir_frames_length_history[p.input_limit - 3] <= DASH_TAP_WINDOW
	and
	p.dir_frames_length_history[p.input_limit - 2] <= DASH_TAP_WINDOW
	and
	p.frames_since_last_dir_input <= DASH_TAP_WINDOW
	and
	p.dir_history[p.input_limit - 2] == Command.CommandTypes.LEFT
	and
	p.dir_history[p.input_limit - 3] == Command.CommandTypes.NEUTRAL
	and
	p.dir_history[p.input_limit - 4] == Command.CommandTypes.LEFT
	)

static func quarter_circle_forward(p: Character) -> bool:
	
	return (
	p.input_reader.current_dir == Command.CommandTypes.RIGHT
	and
	p.dir_history[p.input_limit - 3] == Command.CommandTypes.DOWN_RIGHT
	and
	p.dir_history[p.input_limit - 4] == Command.CommandTypes.DOWN
	and
	p.frames_since_last_dir_input <= MOTION_INPUT_BUFFER_WINDOW
	)

## Makes it so that this motion only registers once when you've just pressed it.
static func dir_just_pressed(p: Character, dir : Command.CommandTypes) -> bool:
	return (
		p.input_reader.current_dir == dir
		and
		p.frames_since_last_atk_input <= 1
	)

static func dir_pressed(p: Character, dir : Command.CommandTypes) -> bool:
	return (
		p.input_reader.current_dir == dir
	)

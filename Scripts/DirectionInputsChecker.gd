extends InputCheck
## Checker for motion & directional inputs
## so that I don't have to fucking copy-paste the same shit
## everywhere
class_name DirectionInput

static func forward_dash(p: Character) -> bool:
	var double_tapf : Array[bool] = [
		forward_pressed(p),
		is_input_neutral(p, p.dir_history[p.input_limit - 3]),
		is_input_forward(p, p.dir_history[p.input_limit - 4])
	]
	
	var fdash_input_timings : Array[bool] = [
		p.dir_frames_length_history[p.input_limit - 3] <= DASH_TAP_WINDOW,
		p.dir_frames_length_history[p.input_limit - 2] <= DASH_TAP_WINDOW,
		p.frames_since_last_dir_input <= DASH_TAP_WINDOW
	]
	
	return (
		not false in double_tapf
		and
		not false in fdash_input_timings
	)

static func back_dash(p: Character) -> bool:
	var double_tapb : Array[bool] = [
		backward_pressed(p),
		is_input_neutral(p, p.dir_history[p.input_limit - 3]),
		is_input_backward(p, p.dir_history[p.input_limit - 4])
	]
	
	var bdash_input_timings : Array[bool] = [
		p.dir_frames_length_history[p.input_limit - 3] <= DASH_TAP_WINDOW,
		p.dir_frames_length_history[p.input_limit - 2] <= DASH_TAP_WINDOW,
		p.frames_since_last_dir_input <= DASH_TAP_WINDOW
	]
	
	return (
		not false in double_tapb
		and
		not false in bdash_input_timings
	)

## For any upward direction input
static func upward_dir_pressed(p: Character) -> bool:
	return (
		p.input_reader.current_dir == Command.CommandTypes.UP
		or
		p.input_reader.current_dir == Command.CommandTypes.UP_RIGHT
		or 
		p.input_reader.current_dir == Command.CommandTypes.UP_LEFT
	)

# Directional Side Stuff
static func neutral_pressed(p: Character) -> bool:
	return p.input_reader.current_dir == Command.CommandTypes.NEUTRAL

static func forward_pressed(p: Character) -> bool:
	if p.current_side_facing == 1:
		return p.input_reader.current_dir == Command.CommandTypes.RIGHT
	else:
		return p.input_reader.current_dir == Command.CommandTypes.LEFT

static func backward_pressed(p: Character) -> bool:
	if p.current_side_facing == 1:
		return p.input_reader.current_dir == Command.CommandTypes.LEFT
	else:
		return p.input_reader.current_dir == Command.CommandTypes.RIGHT

static func up_forward_pressed(p: Character) -> bool:
	if p.current_side_facing == 1:
		return p.input_reader.current_dir == Command.CommandTypes.UP_RIGHT
	else:
		return p.input_reader.current_dir == Command.CommandTypes.UP_LEFT

static func up_backward_pressed(p: Character) -> bool:
	if p.current_side_facing == 1:
		return p.input_reader.current_dir == Command.CommandTypes.UP_LEFT
	else:
		return p.input_reader.current_dir == Command.CommandTypes.UP_RIGHT

static func down_forward_pressed(p: Character) -> bool:
	if p.current_side_facing == 1:
		return p.input_reader.current_dir == Command.CommandTypes.DOWN_RIGHT
	else:
		return p.input_reader.current_dir == Command.CommandTypes.DOWN_LEFT

static func down_backward_pressed(p: Character) -> bool:
	if p.current_side_facing == 1:
		return p.input_reader.current_dir == Command.CommandTypes.DOWN_LEFT
	else:
		return p.input_reader.current_dir == Command.CommandTypes.DOWN_RIGHT

## The "is" functions
## Usually for stuff like if an input is forward or backward

static func is_input_neutral(p: Character, dir: Command.CommandTypes) -> bool:
	return dir == Command.CommandTypes.NEUTRAL

static func is_input_forward(p: Character, dir: Command.CommandTypes) -> bool:
	if p.current_side_facing == 1:
		return dir == Command.CommandTypes.RIGHT
	else:
		return dir == Command.CommandTypes.LEFT

static func is_input_backward(p: Character, dir: Command.CommandTypes) -> bool:
	if p.current_side_facing == 1:
		return dir == Command.CommandTypes.LEFT
	else:
		return dir == Command.CommandTypes.RIGHT

static func is_input_down_forward(p: Character, dir: Command.CommandTypes) -> bool:
	if p.current_side_facing == 1:
		return dir == Command.CommandTypes.DOWN_RIGHT
	else:
		return dir == Command.CommandTypes.DOWN_LEFT

static func is_input_down_backward(p: Character, dir: Command.CommandTypes) -> bool:
	if p.current_side_facing == 1:
		return dir == Command.CommandTypes.DOWN_LEFT
	else:
		return dir == Command.CommandTypes.DOWN_RIGHT

static func is_input_up_forward(p: Character, dir: Command.CommandTypes) -> bool:
	if p.current_side_facing == 1:
		return dir == Command.CommandTypes.UP_RIGHT
	else:
		return dir == Command.CommandTypes.UP_LEFT

static func is_input_up_backward(p: Character, dir: Command.CommandTypes) -> bool:
	if p.current_side_facing == 1:
		return dir == Command.CommandTypes.UP_LEFT
	else:
		return dir == Command.CommandTypes.UP_RIGHT

static func is_input_up(p: Character, dir: Command.CommandTypes) -> bool:
	return dir == Command.CommandTypes.UP

static func is_input_down(p: Character, dir: Command.CommandTypes) -> bool:
	return dir == Command.CommandTypes.DOWN

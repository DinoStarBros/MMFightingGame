extends DirectionInput
## For motion inputs SPECIFICALLY
## like Quuarter Circle Forwards, DPs, etc.
## So that the DirectionInputScript wont be bloated as helll
class_name MotionInput

static func quarter_circle_forward(p: Character) -> bool:
	if p.dir_history.size() == 0:
		return false
	
	if not(p.frames_since_last_dir_input <= MOTION_INPUT_BUFFER_WINDOW):
		return false
	
	## At the end of QCF, Holding down forward
	var true_qcf_holdf : Array[bool] = [
		forward_pressed(p),
		is_input_down_forward(p, p.dir_history[p.input_limit - 3]),
		is_input_down(p, p.dir_history[p.input_limit - 4])
	]
	
	## At the end of QCF, Pressed forward then neutral
	var true_qcf_tapf : Array[bool] = [
		dir_pressed(p, Command.CommandTypes.NEUTRAL),
		is_input_forward(p, p.dir_history[p.input_limit - 3]),
		is_input_down_forward(p, p.dir_history[p.input_limit - 4]),
		is_input_down(p, p.dir_history[p.input_limit - 5])
	]
	
	## Lenient QCF, pressed down->hold forward, no df
	var lenient_qcf_d_f_holdf : Array[bool] = [
		forward_pressed(p),
		is_input_down(p, p.dir_history[p.input_limit - 3])
	]
	
	## Lenient QCF, pressed down->neutral->hold forward, no df
	var lenient_qcf_d_n_f_holdf : Array[bool] = [
		forward_pressed(p),
		is_input_neutral(p, p.dir_history[p.input_limit - 3]),
		is_input_down(p, p.dir_history[p.input_limit - 4])
	]
	
	# "not false in" basically means, check if there's no false elements in the array
	# check if all elements in array are true
	return (
	not false in true_qcf_holdf
	or
	not false in true_qcf_tapf
	or
	not false in lenient_qcf_d_f_holdf
	or
	not false in lenient_qcf_d_n_f_holdf
	)

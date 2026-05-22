class_name InputCheck

## For stuff like QCF, DP, QCB, etc. etc.
## How many frames you can still hold the last direction input of a 
## motion input and still makes it register when pressing the attack
## e.g. holding forward for 30 frames after QCF and then LP will 
## still do fireball.
##  This is in frames
const MOTION_INPUT_BUFFER_WINDOW : float = 30
const DASH_TAP_WINDOW : float = 12

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

## Makes it so that you can only do this attack once when you've just pressed it.
static func attack_just_pressed(p: Character, atk : Command.CommandTypes) -> bool:
	return (
		p.input_reader.current_atk == atk
		and
		p.frames_since_last_atk_input <= 1
	)

## You can hold the input down and it'll still register.
static func attack_pressed(p: Character, atk : Command.CommandTypes) -> bool:
	return (
		p.input_reader.current_atk == atk
	)

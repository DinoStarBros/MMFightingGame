extends InputCheckerScript
## Checker for attack inputs
## so that I don't have to fucking copy-paste the same shit
## everywhere
class_name AttackInput

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

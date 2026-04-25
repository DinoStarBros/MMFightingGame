extends State

func enter() -> void:
	p.character_anim.walk_forward()

func physics_update(delta: float) -> void:
	light_specials_handle()
	if p.input_reader.current_dir == Command.CommandTypes.RIGHT:
		p.velocity.x = p.forward_move_speed
	else:
		state_machine.change_state("idle")


func light_specials_handle() -> void:
	if p.dir_history.size() < p.input_limit - 2: return
	
	if (
		p.input_reader.current_dir == Command.CommandTypes.RIGHT
		and
		p.dir_history[p.input_limit - 3] == Command.CommandTypes.DOWN_RIGHT
		and
		p.dir_history[p.input_limit - 4] == Command.CommandTypes.DOWN
		and 
		p.input_reader.just_atk_pressed(Command.CommandTypes.ONE)
		):
		state_machine.change_state("QCFLight")

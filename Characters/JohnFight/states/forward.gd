extends State

func enter() -> void:
	p.character_anim.walk_forward()

func physics_update(delta: float) -> void:
	light_specials_handle()
	if DirectionInput.dir_pressed(p, Command.CommandTypes.RIGHT):
		p.velocity.x = p.forward_move_speed
	else:
		state_machine.change_state("idle")

func light_specials_handle() -> void:
	if p.dir_history.size() < p.input_limit - 2: return
	
	if DirectionInput.quarter_circle_forward(p):
		if AttackInput.attack_just_pressed(p, Command.CommandTypes.ONE):
			state_machine.change_state("QCFLight")

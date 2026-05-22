extends State

func enter() -> void:
	p.character_anim.walk_forward()

func physics_update(delta: float) -> void:
	if DirectionInput.quarter_circle_forward(p):
		qcf_specials_handle()
	else:
		p.lmh_attacks_handle()
	
	if DirectionInput.dir_pressed(p, Command.CommandTypes.RIGHT):
		p.velocity.x = p.forward_move_speed
	else:
		state_machine.change_state("idle")

func qcf_specials_handle() -> void:
	
	if AttackInput.attack_just_pressed(p, Command.CommandTypes.ONE):
		state_machine.change_state("QCFLight")

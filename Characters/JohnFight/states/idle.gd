extends State

func enter() -> void:
	p.velocity.x = 0
	p.character_anim.idle()

func physics_update(delta: float) -> void:
	#p.apply_friction()
	
	if DirectionInput.dir_pressed(p, Command.CommandTypes.RIGHT):
		_forward_dir_pressed_handling(delta)
	
	if DirectionInput.dir_pressed(p, Command.CommandTypes.LEFT):
		_back_dir_pressed_handling(delta)
	
	#p.lmh_attacks_handle()
	p.grounded_attacks_handle()
	
	if DirectionInput.upward_dir_pressed(p):
		state_machine.change_state("JumpStartup")

func _forward_dir_pressed_handling(delta: float) -> void:
	if DirectionInput.forward_dash(p):
		p.velocity.x = p.forward_dash_speed
		state_machine.change_state("ForwardDash")
	else:
		p.velocity.x = p.forward_move_speed
		state_machine.change_state("Forward")

func _back_dir_pressed_handling(delta: float) -> void:
	if DirectionInput.back_dash(p):
		p.velocity.x = p.backward_dash_speed
		state_machine.change_state("BackDash")
	else:
		p.velocity.x = p.backward_move_speed
		state_machine.change_state("Back")

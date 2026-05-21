extends State

func enter() -> void:
	p.velocity.x = 0
	p.character_anim.idle()

func physics_update(delta: float) -> void:
	
	if DirectionInput.dir_pressed(p, Command.CommandTypes.RIGHT):
		_forward_dir_pressed_handling(delta)
	
	if DirectionInput.dir_pressed(p, Command.CommandTypes.LEFT):
		_back_dir_pressed_handling(delta)
	
	if AttackInput.attack_just_pressed(p, Command.CommandTypes.ONE):
		state_machine.change_state("StandingLight")
	if AttackInput.attack_just_pressed(p, Command.CommandTypes.TWO):
		state_machine.change_state("StandingMedium")
	if AttackInput.attack_just_pressed(p, Command.CommandTypes.THREE):
		state_machine.change_state("StandingHeavy")
	
	if AttackInput.attack_just_pressed(p, Command.CommandTypes.ONE_FOUR):
		state_machine.change_state("QCFLight")
	
	#if DirectionInput.dir_pressed(p, Command.CommandTypes.UP):
		#state_machine.change_state("Jump")
	#if DirectionInput.dir_pressed(p, Command.CommandTypes.UP_RIGHT):
		#state_machine.change_state("ForwardJump")
		#p.velocity.x = p.forward_move_speed
	#if DirectionInput.dir_pressed(p, Command.CommandTypes.UP_LEFT):
		#state_machine.change_state("BackJump")
		#p.velocity.x = p.backward_move_speed
	
	

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

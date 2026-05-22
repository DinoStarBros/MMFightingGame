extends State

func enter() -> void:
	p.character_anim.idle()

func physics_update(delta: float) -> void:
	p.velocity.x = 0
	
	if DirectionInput.forward_pressed(p):
		_forward_dir_pressed_handling(delta)
	
	if DirectionInput.backward_pressed(p):
		_back_dir_pressed_handling(delta)
	
	p.grounded_attacks_handle()
	
	if DirectionInput.upward_dir_pressed(p):
		state_machine.change_state("JumpStartup")

func _forward_dir_pressed_handling(delta: float) -> void:
	if DirectionInput.forward_dash(p):
		state_machine.change_state("ForwardDash")
	else:
		state_machine.change_state("Forward")

func _back_dir_pressed_handling(delta: float) -> void:
	if DirectionInput.back_dash(p):
		state_machine.change_state("BackDash")
	else:
		state_machine.change_state("Back")

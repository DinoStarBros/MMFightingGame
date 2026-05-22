extends State

func enter() -> void:
	p.character_anim.walk_backward()

func physics_update(delta: float) -> void:
	#p.lmh_attacks_handle()
	p.grounded_attacks_handle()
	
	if DirectionInput.dir_pressed(p, Command.CommandTypes.LEFT):
		p.velocity.x = p.backward_move_speed
	else:
		state_machine.change_state("idle")

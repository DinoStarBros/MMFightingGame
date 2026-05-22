extends State

func enter() -> void:
	p.character_anim.walk_forward()

func physics_update(delta: float) -> void:
	
	p.grounded_attacks_handle()
	
	if DirectionInput.dir_pressed(p, Command.CommandTypes.RIGHT):
		p.velocity.x = p.forward_move_speed
	else:
		state_machine.change_state("idle")

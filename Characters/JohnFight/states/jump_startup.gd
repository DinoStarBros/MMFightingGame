extends State

func enter() -> void:
	frames = 0

func physics_update(delta: float) -> void:
	frames += 1
	
	if frames >= p.jump_startup_frames:
		#print(frames)
		if DirectionInput.upward_dir_pressed(p):
			jump_handle()
		else:
			state_machine.change_state("Jump")

func jump_handle() -> void:
	if DirectionInput.dir_pressed(p, Command.CommandTypes.UP):
		state_machine.change_state("Jump")
	if DirectionInput.dir_pressed(p, Command.CommandTypes.UP_RIGHT):
		state_machine.change_state("ForwardJump")
		p.velocity.x = p.forward_move_speed
	if DirectionInput.dir_pressed(p, Command.CommandTypes.UP_LEFT):
		state_machine.change_state("BackJump")
		p.velocity.x = p.backward_move_speed

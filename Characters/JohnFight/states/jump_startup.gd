extends State

func enter(extra_data: Dictionary = {}) -> void:
	frames_elapsed = 0

func physics_update(delta: float) -> void:
	frames_elapsed += 1
	
	if frames_elapsed >= p.jump_startup_frames:
		if DirectionInput.upward_dir_pressed(p):
			jump_handle()
		else:
			state_machine.change_state("Jump")

func jump_handle() -> void:
	if DirectionInput.dir_pressed(p, Command.CommandTypes.UP):
		state_machine.change_state("Jump")
	if DirectionInput.up_forward_pressed(p):
		state_machine.change_state("ForwardJump")
	if DirectionInput.up_backward_pressed(p):
		state_machine.change_state("BackJump")

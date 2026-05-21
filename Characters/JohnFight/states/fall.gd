extends State

func enter() -> void:
	p.character_anim.fall()
	
	frames = 0

func physics_update(delta: float) -> void:
	frames += 1
	if p.is_on_floor():
		print(frames)
		state_machine.change_state("Idle")

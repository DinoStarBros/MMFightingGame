extends State

func enter() -> void:
	p.character_anim.fall()

func physics_update(delta: float) -> void:
	if p.is_on_floor():
		state_machine.change_state("Idle")

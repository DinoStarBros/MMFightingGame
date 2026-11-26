extends State

# This'll have a lot of changes soon
# Just for testing

func enter() -> void:
	p.velocity.x = -400 * p.current_side_facing
	frames_elapsed = 0

func physics_update(delta: float) -> void:
	frames_elapsed += 1
	
	p.velocity.x *= 0.9
	if frames_elapsed >= 20:
		state_machine.change_state("Idle")

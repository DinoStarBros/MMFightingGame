extends State

# This'll have a lot of changes soon
# Just for testing

var hitstun : float = 0
var knockback : float = 0

func enter(extra_data: Dictionary = {}) -> void:
	hitstun = extra_data["hitstun"]
	knockback = extra_data["knockback"]
	
	p.velocity.x = -knockback * p.current_side_facing
	p.character_anim.play_hurt()
	
	frames_elapsed = 0
	p.generic_character_sfx.play_hurt1()

func physics_update(delta: float) -> void:
	frames_elapsed += 1
	
	p.apply_friction(0.9)
	if frames_elapsed >= hitstun:
		state_machine.change_state("Idle")

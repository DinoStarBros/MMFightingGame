extends State

#var bullet_velocity : Vector2
var bullet_spawned : bool = false

func enter(extra_data: Dictionary = {}) -> void:
	frames_elapsed = 0
	
	p.character_anim.qcf_light()
	what_was_pressed = Command.CommandTypes.NEUTRAL
	bullet_spawned = false
	
	#bullet_velocity.x = p.projectile_x_speed * p.current_side_facing

func physics_update(delta: float) -> void:
	p.apply_friction()
	frames_elapsed += 1
	
	if frames_elapsed >= p.qcf_l_startup and !bullet_spawned:
		p.spawn_bullet()
		bullet_spawned = true
	
	if frames_elapsed >= p.qcf_light_frame_total:
		state_machine.change_state("Idle")

func exit() -> void:
	what_was_pressed = Command.CommandTypes.NEUTRAL

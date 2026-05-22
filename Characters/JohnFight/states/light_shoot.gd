extends State

var bullet_velocity : Vector2
var bullet_spawned : bool = false

func enter() -> void:
	frames = 0
	
	p.character_anim.qcf_light()
	what_was_pressed = Command.CommandTypes.NEUTRAL
	bullet_spawned = false
	
	bullet_velocity.x = p.projectile_x_speed * p.current_side_facing

func physics_update(delta: float) -> void:
	p.apply_friction()
	frames += 1
	
	if frames >= p.qcf_l_startup and !bullet_spawned:
		spawn_bullet(bullet_velocity)
		bullet_spawned = true
	
	if frames >= p.qcf_light_frame_total:
		state_machine.change_state("Idle")

func exit() -> void:
	what_was_pressed = Command.CommandTypes.NEUTRAL

func spawn_bullet(velocity : Vector2) -> void:
	var bullet : Projectile = References.bullet_scn.instantiate()
	References.stage.add_child(bullet)
	bullet.velocity = velocity
	bullet.global_position = p.global_position

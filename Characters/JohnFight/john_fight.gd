extends Character
class_name JohnFight

@onready var hurtbox_component: HurtboxComponent = %HurtboxComponent

func _onready() -> void:
	hurtbox_component.collision_layer_setup(is_p1)
	hurtbox_component.Hurt.connect(hurt)

func _physics_process(delta: float) -> void:
	move_and_slide()
	
	dir_history = input_reader.dir_history
	atk_history = input_reader.atk_history
	input_limit = input_reader.input_limit
	frames_since_last_dir_input = input_reader.frames_since_last_dir_input
	frames_since_last_atk_input = input_reader.frames_since_last_atk_input
	dir_frames_length_history = input_reader.dir_frames_length_history
	atk_frames_length_history = input_reader.atk_frames_length_history
	
	if not is_on_floor():
		if velocity.y >= 0:
			# Falling
			velocity.y += Global.GRAVITY * delta * 3.4
		else:
			# Jumping
			velocity.y += Global.GRAVITY * delta * 2.9
	
	face_enemy()
	
	# 3
	# 22
	# 20
	# 1

func hurt(attack: AttackClass) -> void:
	state_machine.change_state(
		"Hurt1",
		{
			"knockback": attack.knockback,
			"hitstun": attack.hitstun_frames
		}
	)

func spawn_bullet() -> void:
	var bullet : Projectile = References.bullet_scn.instantiate()
	if bullet.hitbox:
		bullet.hitbox.collision_layer_setup(is_p1)
		bullet.hitbox.load_data_from_resource(attacks_moveset["QCFL"])
	References.stage.add_child(bullet)
	bullet.velocity.x = current_side_facing * 2000
	bullet.global_position = global_position

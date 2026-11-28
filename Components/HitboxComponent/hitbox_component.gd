extends Area2D
class_name HitboxComponent

var attack : AttackClass = AttackClass.new()

signal Hit(attack: AttackClass)

func _ready() -> void:
	area_entered.connect(_hurtbox_entered)

func collision_layer_setup(is_p1: bool) -> void:
	set_collision_layer_value(4, false)
	set_collision_layer_value(5, false)
	
	set_collision_mask_value(2, false)
	set_collision_mask_value(3, false)
	
	if is_p1:
		# P1 Hitbox hitting P2 hurtbox
		set_collision_layer_value(4, true)
		set_collision_mask_value(3, true)
	else:
		# P2 Hitbox hitting P1 hurtbox
		set_collision_layer_value(5, true)
		set_collision_mask_value(2, true)

func load_data_from_resource(attack_move_resource: BaseAttackResource) -> void:
	attack.damage = attack_move_resource.damage
	attack.knockback = attack_move_resource.knockback
	attack.hitstun_frames = attack_move_resource.stun_frames_on_hit

func _hurtbox_entered(area : Area2D) -> void:
	if area is HurtboxComponent:
		attack.attack_pos = global_position
		area.on_hit(attack)
		Hit.emit(attack)

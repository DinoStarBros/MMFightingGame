extends Area2D
class_name HitboxComponent

enum attack_types {
	HIGH, MID, LOW, OVERHEAD,
	UNBLOCKABLE, GRAB,
}

@export var attack_type : attack_types

var attack : Attack = Attack.new()

signal Hit(attack: Attack)

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

func _hurtbox_entered(area : Area2D) -> void:
	if area is HurtboxComponent:
		attack.attack_pos = global_position
		area.on_hit(attack)
		Hit.emit(attack)

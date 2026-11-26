extends Area2D
class_name HurtboxComponent

@export var health_component : HealthComponent

func _ready() -> void:
	pass

func collision_layer_setup(is_p1: bool) -> void:
	
	set_collision_layer_value(2, false)
	set_collision_layer_value(3, false)
	
	set_collision_mask_value(2, false)
	set_collision_mask_value(3, false)
	
	if is_p1:
		# P1 Hurtbox
		set_collision_layer_value(2, true)
		set_collision_mask_value(5, true)
	else:
		# P2 Hurtbox
		set_collision_layer_value(3, true)
		set_collision_mask_value(4, true)

func on_hit(attack: Attack) -> void:
	health_component.hp -= roundi(attack.damage)
	breakpoint

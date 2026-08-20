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

func _hurtbox_entered(area : Area2D) -> void:
	if area is HurtboxComponent:
		attack.attack_pos = global_position
		area.on_hit(attack)
		Hit.emit(attack)

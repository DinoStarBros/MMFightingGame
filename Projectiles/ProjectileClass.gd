extends Node2D
class_name Projectile

@export var hitbox : HitboxComponent

var velocity : Vector2

func _ready() -> void:
	pass

func move(delta: float) -> void:
	global_position += velocity * delta

func _on_hit(attack: AttackClass) -> void:
	queue_free()

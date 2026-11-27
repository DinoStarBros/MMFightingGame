extends Node2D
class_name Projectile

@export var hitboxes : Array[HitboxComponent]

var velocity : Vector2

func _ready() -> void:
	pass

func move(delta: float) -> void:
	global_position += velocity * delta

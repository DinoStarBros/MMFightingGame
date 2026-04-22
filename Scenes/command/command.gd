extends Node2D
class_name Command

enum CommandTypes {
	RIGHT, UP_RIGHT,
	UP, UP_LEFT,
	LEFT, DOWN_LEFT,
	DOWN, DOWN_RIGHT,
	
	ONE, TWO, THREE, FOUR
}

@onready var sprite: Sprite2D = %Sprite2D

var command_type : CommandTypes
var velocity : Vector2

func _ready() -> void:
	sprite.frame = command_type + 1
	velocity.x = -sprite.scale.x * 16

func _physics_process(delta: float) -> void:
	global_position += velocity

extends Node2D
class_name Command

enum CommandTypes {
	NEUTRAL,
	
	RIGHT, UP_RIGHT,
	UP, UP_LEFT,
	LEFT, DOWN_LEFT,
	DOWN, DOWN_RIGHT,
	
	ONE, TWO, THREE, FOUR,
	ONE_TWO, TWO_THREE, THREE_FOUR, ONE_FOUR,
	ONE_THREE, TWO_FOUR,
	ONE_TWO_THREE, TWO_THREE_FOUR, THREE_FOUR_ONE, ONE_FOUR_TWO,
	ALL_FOUR,
	
}

@onready var sprite: Sprite2D = %Sprite2D

var command_type : CommandTypes
var velocity : Vector2

func _init() -> void:
	GlobalSignal.TickInputP1.connect(_tick_input)

func _ready() -> void:
	sprite.frame = command_type + 1
	velocity.x = -sprite.scale.x * 16

func _tick_input() -> void:
	global_position += velocity
	if global_position.x <= -16:
		queue_free()

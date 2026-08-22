extends Node2D
class_name Command

var is_player_1 : bool

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

func _ready() -> void:
	sprite.frame = command_type + 1
	velocity.x = -sprite.scale.x * 16

	if is_player_1:
		GlobalSignal.TickInputP1.connect(_tick_input_p1)
	else:
		GlobalSignal.TickInputP2.connect(_tick_input_p2)

func _tick_input_p1() -> void:
	global_position += velocity
	if global_position.x <= -16:
		queue_free()

func _tick_input_p2() -> void:
	global_position += velocity
	if global_position.x <= -16:
		queue_free()

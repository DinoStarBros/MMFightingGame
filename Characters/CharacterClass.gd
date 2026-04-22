extends CharacterBody2D
class_name Character

enum CharacterSide {
	P1, P2
}

@export var character_side : CharacterSide
@export var input_reader : InputReader

@export_category("Movement Stats")
@export var forward_move_speed : float = 500
@export var backward_move_speed : float = -500
@export var jump_velocity: float = 980

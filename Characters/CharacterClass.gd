extends CharacterBody2D
class_name Character

enum CharacterSide {
	P1, P2
}

@export var character_side : CharacterSide
@export var input_reader : InputReader
@export var character_anim : CharacterAnim

@export_category("Movement Stats")
@export var forward_move_speed : float = 500
@export var backward_move_speed : float = -500
@export var jump_velocity: float = 980
@export var forward_dash_speed : float = 800
@export var backward_dash_speed : float = -700

@export_category("Frame Data BS")
@export var f_dash_total_frames : int = 19

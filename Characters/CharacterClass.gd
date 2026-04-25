extends CharacterBody2D
class_name Character

enum CharacterSide {
	P1, P2
}

var dir_history : Array
var atk_history : Array
var input_limit : int
var frames_since_last_dir_input : int
var frames_since_last_atk_input : int
var dir_frames_length_history : Array
var atk_frames_length_history : Array

@export var character_side : CharacterSide
@export var input_reader : InputReader
@export var character_anim : CharacterAnim

@export_category("Movement Stats")
@export var forward_move_speed : float = 500
@export var backward_move_speed : float = -500
@export var jump_speed: float = 700
@export_subgroup("Dash Stats")
@export var forward_dash_speed : float = 800
@export var f_dash_friction : float = 0.9
@export var backward_dash_speed : float = -700
@export var b_dash_friction : float = 0.9

@export_category("Frame Data BS")
@export_subgroup("Dash Frames")
@export var f_dash_total_frames : int = 19
@export var b_dash_total_frames : int = 23
@export_subgroup("Base Attacks Frames")
@export var standing_l_total_frames : int = 13

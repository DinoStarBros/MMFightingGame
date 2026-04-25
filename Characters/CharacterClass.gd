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

var gatling_count : int

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
@export var standing_l_recovery_start_frame : int = 7 ## This is how many frames till u can start buffering/cancels
@export var standing_m_total_frames : int = 20
@export var standing_m_recovery_start_frame : int = 10 ## This is how many frames till u can start buffering/cancels
@export var standing_h_total_frames : int = 31
@export var standing_h_recovery_start_frame : int = 14 ## This is how many frames till u can start buffering/cancels
@export_subgroup("Specials")
@export var qcf_light_frame_total : int = 47
@export var qcf_l_startup : int = 14

@export_category("Combat Stats")
@export var bullet_x_speed : float = 1000

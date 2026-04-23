extends Node2D
## I've made it so that the animations of the character
## is its own scene different from the base character scene itself.
## Just so that I don't have to stare at a cluttered ass scene tree
## And for convenience
class_name CharacterAnim

@export var current_frame_idx : int = 0
@export var animation_parent_nodes : Dictionary

var frame : int = 0
var current_frame : Frame
var is_all_frames_loaded : bool = false

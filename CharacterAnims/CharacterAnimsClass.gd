extends Node2D
## I've made it so that the animations of the character
## is its own scene different from the base character scene itself.
## Just so that I don't have to stare at a cluttered ass scene tree
## And for convenience
class_name CharacterAnim

## Signal that gets emitted when an animation is done playing.
## For stuff that plays and then you go back to idle, like
## dashing, attacking, etc.
signal AnimationDone

func emit_anim_done() -> void:
	AnimationDone.emit()

func idle() -> void:
	assert(false, "Override this function")

func walk_forward() -> void:
	assert(false, "Override this function")

func walk_backward() -> void:
	assert(false, "Override this function")

func forward_dash() -> void:
	assert(false, "Override this function")

func back_dash() -> void:
	assert(false, "Override this function")

func show_specific_sprite(sprite_name: String) -> void:
	assert(false, "Override this function")

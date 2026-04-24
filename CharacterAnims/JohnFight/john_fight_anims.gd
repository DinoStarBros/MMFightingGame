extends CharacterAnim
class_name JohnFightAnims

@onready var anim: AnimationPlayer = %anim
@onready var sprites_parent: Node2D = %sprites

func _ready() -> void:
	pass

func idle() -> void:
	play_animation("idle")

func walk_forward() -> void:
	play_animation("walk_forward")

func walk_backward() -> void:
	play_animation("walk_backward")

func forward_dash() -> void:
	play_animation("forward_dash")

func play_animation(animation_name : String):
	anim.stop()
	anim.play(animation_name)
	show_specific_sprite(animation_name)

func show_specific_sprite(sprite_name: String) -> void:
	for s in sprites_parent.get_children():
		s.hide()
	
	find_child(sprite_name).show()

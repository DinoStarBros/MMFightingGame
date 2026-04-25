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

func jump() -> void:
	play_animation("jump")
	play_sfx_pitch_rand(%jump)

func fall() -> void:
	play_animation("fall")

func forward_dash() -> void:
	play_animation("forward_dash")
	play_sfx_pitch_rand(%dash)

func back_dash() -> void:
	play_animation("back_dash")
	play_sfx_pitch_rand(%dash, 0.8)

func standing_light() -> void:
	play_animation("standing_light")
	play_sfx_pitch_rand(%atk)

func standing_medium() -> void:
	play_animation("standing_medium")
	play_sfx_pitch_rand(%atk, 0.8)

func standing_heavy() -> void:
	play_animation("standing_heavy")
	play_sfx_pitch_rand(%heavy_atk_wind, 1.2)

func qcf_light() -> void:
	play_animation("qcf_light")

func play_animation(animation_name : String):
	anim.stop()
	anim.play(animation_name)
	show_specific_sprite(animation_name)

func show_specific_sprite(sprite_name: String) -> void:
	for s in sprites_parent.get_children():
		s.hide()
	
	find_child(sprite_name).show()

func play_sfx_pitch_rand(sfx: AudioStreamPlayer,base_pitch: float = 1, pitch_deviation: float = .1, start_pos:float=0) -> void:
	sfx.pitch_scale = base_pitch + randf_range(-pitch_deviation, pitch_deviation)
	sfx.play(start_pos)

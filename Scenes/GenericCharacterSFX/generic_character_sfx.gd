extends Node
class_name GenericCharacterSFX

func play_hurt1() -> void:
	%hurt1.play(0.43)
	%hurt1.pitch_scale = 1 + randf_range(-0.1,0.1)

func play_hurt2() -> void:
	%hurt2.play(0.43)
	%hurt2.pitch_scale = 0.7 + randf_range(-0.1,0.1)

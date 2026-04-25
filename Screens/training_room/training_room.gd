extends Node2D
class_name TrainingRoom

func _ready() -> void:
	References.stage = self
	
	%quit.pressed.connect(
		func(): SceneManager.change_scene("res://Screens/title_screen/title_screen.tscn")
	)

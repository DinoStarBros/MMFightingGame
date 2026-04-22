extends Control
class_name TitleScreen

func _ready() -> void:
	%quit.pressed.connect(
		func(): get_tree().quit()
	)
	
	%play.pressed.connect(
		func(): SceneManager.change_scene("res://Screens/training_room/training_room.tscn")
	)

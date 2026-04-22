extends Control
class_name TitleScreen

func _ready() -> void:
	%quit.pressed.connect(
		func(): get_tree().quit()
	)
	
	%play.pressed.connect(
		func(): pass
	)

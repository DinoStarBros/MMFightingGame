extends CanvasLayer
class_name PlayerPauseUI

@onready var resume_btn: Button = %ResumeBtn
@onready var quit_btn: Button = %QuitBtn
@onready var sure_btn: Button = %SureBtn

func pause_or_unpause() -> void:
	visible = !visible
	get_tree().paused = !get_tree().paused

func _resume_btn_pressed() -> void:
	pause_or_unpause()

func _quit_btn_pressed() -> void:
	sure_btn.visible = !sure_btn.visible

func _sure_btn_pressed() -> void:
	SceneManager.change_scene("res://Screens/title_screen/title_screen.tscn")
	SaveLoad._save()

func _ready() -> void:
	resume_btn.pressed.connect(_resume_btn_pressed)
	quit_btn.pressed.connect(_quit_btn_pressed)
	sure_btn.pressed.connect(_sure_btn_pressed)

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("pause"):
		pause_or_unpause()

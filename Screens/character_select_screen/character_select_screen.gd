extends Control
class_name CharacterSelectScreen

const character_select_btn_scn : PackedScene = preload("res://Scenes/CharacterSelectButton/character_select_button.tscn")
const character_select_infos : Array[CharacterSelectInfo] = [
	preload("res://Resources/CharacterSelectInfo/JohnFightInfo.tres"),
	preload("res://Resources/CharacterSelectInfo/Char2Info.tres"),
	preload("res://Resources/CharacterSelectInfo/Random.tres"),
	
]

@onready var character_select_buttons_parent: GridContainer = %CharacterSelectButtonsParent

func _ready() -> void:
	%next_btn.pressed.connect(
		func(): SceneManager.change_scene("res://Screens/training_room/training_room.tscn")
	)
	
	for character_select_info in character_select_infos:
		make_character_select_button(character_select_info)

func make_character_select_button(character_select_info: CharacterSelectInfo) -> void:
	var character_select_btn : CharacterSelectButton = character_select_btn_scn.instantiate()
	character_select_btn.character_select_info = character_select_info
	character_select_buttons_parent.add_child(character_select_btn)

func make_big_character_portrait(character_select_info: CharacterSelectInfo) -> void:
	pass

extends PanelContainer
class_name CharacterSelectButton

@onready var portrait: TextureRect = %portrait

var character_select_info : CharacterSelectInfo

func _ready() -> void:
	portrait.texture = character_select_info.portrait_texture

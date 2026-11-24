extends PanelContainer
class_name CharacterSelectSlot

@export var top_slot : CharacterSelectSlot

@onready var portrait: TextureRect = %portrait

var character_select_info : CharacterSelectInfo

func _ready() -> void:
	portrait.texture = character_select_info.portrait_texture

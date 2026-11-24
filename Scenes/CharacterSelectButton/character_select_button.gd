extends PanelContainer
class_name CharacterSelectSlot

@export var character_select_info : CharacterSelectInfo

@export_category("Selection Neighbors")
@export var top_slot : CharacterSelectSlot
@export var bottom_slot : CharacterSelectSlot
@export var left_slot : CharacterSelectSlot
@export var right_slot : CharacterSelectSlot

@onready var portrait: TextureRect = %portrait

func _ready() -> void:
	portrait.texture = character_select_info.portrait_texture

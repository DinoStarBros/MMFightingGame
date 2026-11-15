extends Area2D
class_name CharacterSelectCursor

@onready var sprite: Sprite2D = %sprite
@onready var debug: Label = %debug

@export var is_p1 : bool = true

const TILE_SIZE : float = 80
const START_POS : Vector2 = Vector2(640,320)

var tile_position : Vector2 = Vector2.ZERO

func _ready() -> void:
	position = START_POS
	if is_p1:
		sprite.frame = 0
	else:
		sprite.frame = 1
	
	area_entered.connect(_on_area_entered)

func _input(event: InputEvent) -> void:
	if is_p1:
		p1_input_handle()
	else:
		p2_input_handle()
	update_position()

func p1_input_handle() -> void:
	if Input.is_action_just_pressed("p1up"):
		tile_position.y -= 1
	if Input.is_action_just_pressed("p1down"):
		tile_position.y += 1
	if Input.is_action_just_pressed("p1left"):
		tile_position.x -= 1
	if Input.is_action_just_pressed("p1right"):
		tile_position.x += 1

func p2_input_handle() -> void:
	if Input.is_action_just_pressed("p2up"):
		tile_position.y -= 1
	if Input.is_action_just_pressed("p2down"):
		tile_position.y += 1
	if Input.is_action_just_pressed("p2left"):
		tile_position.x -= 1
	if Input.is_action_just_pressed("p2right"):
		tile_position.x += 1

func update_position() -> void:
	global_position = TILE_SIZE * (
		tile_position + Vector2(8, 4)
		)
	
	if get_overlapping_areas().size() <= 0:
		debug.text = ""
		return
	
	for area in get_overlapping_areas():
		if area is CharSelBtnArea:
			debug.text = str(area.parent.character_select_info.key)

func _on_area_entered(area: Area2D) -> void:
	pass

extends Control
class_name CharacterSelectScreen

@onready var rand_slot: CharacterSelectSlot = %rand
@onready var p1_cursor: Sprite2D = %p1cursor
@onready var p2_cursor: Sprite2D = %p2cursor
@onready var move_selection_sfx: AudioStreamPlayer = %move_selection_sfx

const offset: Vector2 = Vector2(35,35)

var p1_selected_slot : CharacterSelectSlot:
	set(value):
		p1_selected_slot = value
		p1_cursor.global_position = p1_selected_slot.global_position + offset
		move_selection_sfx.play()
var p2_selected_slot : CharacterSelectSlot:
	set(value):
		p2_selected_slot = value
		p2_cursor.global_position = p2_selected_slot.global_position + offset
		move_selection_sfx.play()

func _ready() -> void:
	%next_btn.pressed.connect(
		func(): SceneManager.change_scene("res://Screens/training_room/training_room.tscn")
	)
	
	await get_tree().process_frame
	p1_selected_slot = rand_slot
	p2_selected_slot = rand_slot
	move_selection_sfx.stop()

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("p1up") and p1_selected_slot.top_slot:
		p1_selected_slot = p1_selected_slot.top_slot
	if Input.is_action_just_pressed("p1down") and p1_selected_slot.bottom_slot:
		p1_selected_slot = p1_selected_slot.bottom_slot
	if Input.is_action_just_pressed("p1left") and p1_selected_slot.left_slot:
		p1_selected_slot = p1_selected_slot.left_slot
	if Input.is_action_just_pressed("p1right") and p1_selected_slot.right_slot:
		p1_selected_slot = p1_selected_slot.right_slot
	
	if Input.is_action_just_pressed("p2up") and p2_selected_slot.top_slot:
		p2_selected_slot = p2_selected_slot.top_slot
	if Input.is_action_just_pressed("p2down") and p2_selected_slot.bottom_slot:
		p2_selected_slot = p2_selected_slot.bottom_slot
	if Input.is_action_just_pressed("p2left") and p2_selected_slot.left_slot:
		p2_selected_slot = p2_selected_slot.left_slot
	if Input.is_action_just_pressed("p2right") and p2_selected_slot.right_slot:
		p2_selected_slot = p2_selected_slot.right_slot

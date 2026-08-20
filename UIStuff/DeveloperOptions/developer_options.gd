extends CanvasLayer
class_name DeveloperOptions

@onready var generic_add_stuff: GridContainer = %GenericAddStuff

func _ready() -> void:
	await get_tree().process_frame
	
	visible = Global.enable_developer_options
	
	for thing in stuff:
		make_generic_add_button(thing)

## Could be stuff like resources or scenes. 
## It has to be of the same type.
const stuff : Array = [
	
]

func make_generic_add_button(thing: Variant) -> void:
	var button : Button = Button.new()
	#button.text = thing.key
	
	# The function will be something like spawn_enemy(res) or add_weapon(res)
	button.pressed.connect(func():pass)
	
	button.focus_mode = Control.FOCUS_NONE
	generic_add_stuff.add_child(button)

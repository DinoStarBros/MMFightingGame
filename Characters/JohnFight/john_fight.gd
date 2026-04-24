extends Character
class_name JohnFight

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	move_and_slide()
	
	if not is_on_floor():
		velocity.y += Global.GRAVITY * delta

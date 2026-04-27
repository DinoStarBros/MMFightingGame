extends CharacterBody2D
class_name Dummy


func _physics_process(delta: float) -> void:
	move_and_slide()
	
	if not is_on_floor():
		if velocity.y >= 0: # Falling
			velocity.y += Global.GRAVITY * delta * 1.5
		else: # Jumping
			velocity.y += Global.GRAVITY * delta * 1.2

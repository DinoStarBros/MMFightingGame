extends Projectile

func _ready() -> void:
	%Duration.timeout.connect(
		func(): queue_free()
	)

func _physics_process(delta: float) -> void:
	move(delta)

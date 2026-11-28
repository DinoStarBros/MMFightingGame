extends Projectile

func _ready() -> void:
	%Duration.timeout.connect(
		func(): queue_free()
	)
	hitbox.Hit.connect(_on_hit)

func _physics_process(delta: float) -> void:
	move(delta)

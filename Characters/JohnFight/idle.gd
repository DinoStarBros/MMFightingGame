extends State

func enter() -> void:
	p.velocity.x = 0

func physics_update(delta: float) -> void:
	if p.input_reader.current_dir == Command.CommandTypes.RIGHT:
		pass

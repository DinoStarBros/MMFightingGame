extends Node
class_name State

@onready var p : Character = owner

var state_machine : StateMachine

func enter() -> void:
	pass

func exit() -> void:
	pass

func update(delta: float) -> void:
	pass

func physics_update(delta: float) -> void:
	pass

func handle_input(input: InputEvent) -> void:
	pass

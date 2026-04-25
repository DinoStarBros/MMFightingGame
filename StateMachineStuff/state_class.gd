extends Node
class_name State

@onready var p : Character = owner

var state_machine : StateMachine
var frames : int = 0

var what_was_pressed : Command.CommandTypes
var allow_buffer : bool = false

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

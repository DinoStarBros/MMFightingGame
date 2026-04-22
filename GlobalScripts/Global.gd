extends Node

const GRAVITY : float = 980

## ITS A FIGHTING GAME, IT HAS FRAME DATA SYSTEM THINGY
## This happens every 60th of a second
signal Tick

var tick_timer : int = 0
var tikitkitki : float = 0
func _physics_process(delta: float) -> void:
	tick_timer += 1
	
	tikitkitki += delta
	if tikitkitki >= 1:
		tick_timer = 0
		tikitkitki = 0
	
	#print(tick_timer)

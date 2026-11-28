extends Resource
class_name BaseAttackResource

@export var damage: float = 300
@export var knockback: float = 100
@export var stun_frames_on_hit: int = 11
@export var stun_frames_on_block: int = 6
## This is how many frames till u can start buffering/cancels
@export var recovery_start_frame: int = 7

@export var total_frames: int = 13

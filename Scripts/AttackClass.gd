extends RefCounted
class_name AttackClass

enum attack_types {
	HIGH, MID, LOW, OVERHEAD,
	UNBLOCKABLE, GRAB,
}
var attack_type : attack_types

var damage : float
var knockback : float
var attack_pos : Vector2
var knockback_direction : Vector2
var hitstun_frames : int

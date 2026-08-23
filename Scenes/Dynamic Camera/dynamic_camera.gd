extends Camera2D
class_name DynamicCamera

@export var track_both_x_and_y : bool = false

var player_1 : Character
var player_2 : Character

## The average position of the 2 players' positions
func get_average_position_between_players() -> Vector2:
	return Vector2(
		(player_1.global_position.x + player_2.global_position.x) / 2,
		(player_1.global_position.y + player_2.global_position.y) / 2
		)

func get_distance_between_players() -> float:
	return (
		References.player_1_character.global_position.distance_to(
			References.player_2_character.global_position
		)
	)

func get_camera_zoom(distance: float) -> float:
	const MIN_ZOOM : float = 0.5
	const MAX_ZOOM : float = 1.0
	
	const MAX_DISTANCE : float = 2000.0
	const MIN_DISTANCE : float = 1000.0
	
	var distance_percent : float = remap(
			distance,
			MIN_DISTANCE,
			MAX_DISTANCE,
			0.0,
			1.0
		)
	distance_percent = clamp(distance_percent, 0.0, 1.0)
	
	return lerp(
		MAX_ZOOM,
		MIN_ZOOM,
		distance_percent
	)

func _ready() -> void:
	player_1 = References.player_1_character
	player_2 = References.player_2_character

func _physics_process(delta: float) -> void:
	
	if track_both_x_and_y:
		
		var desire_pos : Vector2 = Vector2(
			get_average_position_between_players().x,
			(get_average_position_between_players().y + 200) / 2
			)
		
		global_position = lerp(
			global_position,
			desire_pos,
			8.0 * delta
			)
	else:
		
		global_position.x = lerp(
			global_position.x,
			get_average_position_between_players().x,
			8.0 * delta
			)
	
	zoom.x = get_camera_zoom(get_distance_between_players())
	zoom.y = zoom.x

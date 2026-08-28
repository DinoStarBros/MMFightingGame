extends Node

const GRAVITY : float = 980 * 2

func volume_handle() -> void:
	AudioServer.set_bus_volume_db(
		0,
		linear_to_db(SaveLoad.SaveFileData.master_volume)
	)
	AudioServer.set_bus_volume_db(
		1,
		linear_to_db(SaveLoad.SaveFileData.music_volume)
	)
	AudioServer.set_bus_volume_db(
		2,
		linear_to_db(SaveLoad.SaveFileData.sfx_volume)
	)

func _init() -> void:
	#volume_handle()
	pass

func _process(delta: float) -> void:
	volume_handle()

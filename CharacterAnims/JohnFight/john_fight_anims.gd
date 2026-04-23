extends CharacterAnim
class_name JohnFightAnims

func _ready() -> void:
	await get_tree().process_frame
	
	is_all_frames_loaded = true
	
	#print(all_frames)

func _physics_process(delta: float) -> void:
	if !is_all_frames_loaded: return
	
	#frame = wrapi(frame + 1, 0, all_frames.size())
	
	#current_frame = all_frames[frame]
	
	#for frm in all_frames: if frm is Frame:
	#if frm == current_frame:
		#frm.is_current_frame = true
	#else:
		#frm.is_current_frame = false

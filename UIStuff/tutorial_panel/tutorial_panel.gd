extends Control
class_name TutorialPanel

@onready var pages : Array[MarginContainer] = [
	%page1,
	%page2,
	%page3,
	%page4,
	%page5,
	%page6,
	%page7,
	
]
@onready var vids : Array[VideoStreamPlayer] = [
	%vid1,
	%vid2,
	%vid3,
	%vid4,
	%vid5,
	
]

var current_page : int = 0

func _ready() -> void:
	_update_page()
	%next.pressed.connect(_next_pressed)
	%prev.pressed.connect(_prev_pressed)
	%close.pressed.connect(
		hide
	)

func _next_pressed() -> void:
	_change_current_page_num(1)

func _prev_pressed() -> void:
	_change_current_page_num(-1)

func _change_current_page_num(change: int) -> void:
	current_page += change
	current_page = wrapi(current_page, 0, pages.size())
	_update_page()

func _update_page() -> void:
	var ndex : int = -1
	for page in pages:
		page.hide()
		ndex += 1
		if ndex == current_page:
			page.show()
	
	%page_no_txt.text = str(current_page+1, "/", pages.size())
	
	for video in vids:
		var vid_par = video.get_parent().get_parent()
		
		if vid_par.visible:
			video.play()
		else:
			video.stop()

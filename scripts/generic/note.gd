extends Node

class_name Note

var hideable	

func setup():
	define_hideable()
	hideable.visible = false

func define_hideable():
	pass

func play_sfx():
	pass
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("open_notes"):
		if hideable.visible == true:
			hideable.visible = false
			
		elif hideable.visible == false:
			hideable.visible = true
			play_sfx()

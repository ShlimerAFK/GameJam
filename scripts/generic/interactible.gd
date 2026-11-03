extends StaticBody2D

class_name Interactable

@onready var gui = $"../GUI"

var player_has_entered: bool = false

func _on_area_2d_area_entered(area: Area2D) -> void:
	player_has_entered = true
	gui.show_lable()
	
func _on_area_2d_area_exited(area: Area2D) -> void:
	player_has_entered = false
	gui.hide_lable()

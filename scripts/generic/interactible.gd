extends Node

class_name Interactable

var current_area: Area2D

@onready var gui = $"../GUI"

var player_has_entered: bool = false

func entered_area(area: Area2D):

	current_area = area
	player_has_entered = true
	gui.show_lable()

func exited_area(area: Area2D):
	player_has_entered = false
	gui.hide_lable()
	

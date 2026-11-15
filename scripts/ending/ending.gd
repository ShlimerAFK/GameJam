extends Control

var file = "ending.json"

@onready var timer: Timer = $Timer
@onready var narratio_node = $NarrationNode
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var sanity_state = GlobalSanity.get_sanity_state()
	var ending_dialog : String
	if sanity_state <= 3:
		ending_dialog = "ending_1"
		timer.start(10)
	else:
		ending_dialog = "ending_2"
		timer.start(10)
	
	narratio_node.start_narration(ending_dialog, file)

func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

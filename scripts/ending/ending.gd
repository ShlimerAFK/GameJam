extends Control

var file = "ending.json"

@onready var narratio_node = $NarrationNode
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var sanity_state = GlobalSanity.get_sanity_state()
	var ending_dialog : String
	if sanity_state <= 3:
		ending_dialog = "ending_1"
	else:
		ending_dialog = "ending_2"
	
	narratio_node.start_narration(ending_dialog, file)

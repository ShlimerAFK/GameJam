extends Node2D

@onready var narration = $"../GUI/NarrationNode"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	#GlobalTimeLoop.start_time_loop_timer()
	#GlobalTimeLoop.start_narr_timer()
	
	#GlobalTimeLoop.start_Sanity_timer()
	
	GlobalMusic.connect_to_sanity()

	if GlobalTimeLoop.has_narrated == false:
		play_narration("narr_1")
		GlobalTimeLoop.has_narrated = true
		
	
func play_narration(narr: String):
	if GlobalTimeLoop.day == 1:
		narration.start_narration(narr, "day_1.json")
		
	else:
		narration.start_narration(narr, "other_days.json")

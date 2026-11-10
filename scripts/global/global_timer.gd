extends Node

@onready var timer = $Timer
var loop_length := 10
# Called when the node enters the scene tree for the first time.

func start_time_loop_timer():
	timer.start(loop_length)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func restart_timeloop():
	Global.next_spawn_door = "Door1"
	get_tree().change_scene_to_file("res://scenes/office_1.tscn")
	GlobalTimeLoop.start_time_loop_timer()
	GlobalSanity.decrease_sanity(5)
	Global.reset_active_quests()

func _on_timer_timeout() -> void:
	restart_timeloop()

extends Node

@onready var narration_node = $".."
@onready var loop_timer = $LoopTimer
@onready var narr_timer = $NarrTimer
var loop_length := 400
var day := 1 

var has_narrated = false
# Called when the node enters the scene tree for the first time.

signal narr_timeout

func start_time_loop_timer():
	loop_timer.start(loop_length)
	
func start_narr_timer():
	narr_timer.start(100)

func start_narr_timer_short():
	narr_timer.start(50)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func restart_timeloop():
	Global.next_spawn_door = "Door1"
	get_tree().change_scene_to_file("res://scenes/office_1.tscn")
	GlobalTimeLoop.start_time_loop_timer()
	GlobalSanity.decrease_sanity(5)
	Global.reset_active_quests()
	day += 1
	has_narrated = false

func _on_timer_timeout() -> void:
	restart_timeloop()


func _on_narr_timer_timeout() -> void:
	narr_timeout.emit()

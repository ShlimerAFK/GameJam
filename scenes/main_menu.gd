extends Node2D
@export var transition_type: String
@export var duration: float
@export var scene_destination: String



func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/office_1.tscn")
	#GlobalTimeLoop.start_time_loop_timer()
	#GlobalTimeLoop.start_narr_timer()
	
	#GlobalTimeLoop.start_Sanity_timer()
	
	


func _on_settings_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/settings.tscn")


func _on_exit_pressed() -> void:
	get_tree().quit()

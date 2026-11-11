extends Interactable

@export var scene_destination: String
# example: scene_1.tscn
@export var destination_door_name: String
# example: Door1
@export var door_position_in_room: String
# example: top, bottom




func _process(_delta):
	if player_has_entered == true and Input.is_action_just_pressed("interact") and not Global.player_is_interacting:
		get_tree().change_scene_to_file("res://scenes/" + scene_destination)
		Global.player_is_interacting = true
		Global.next_spawn_door = destination_door_name
		
		


func _on_area_entered(area: Area2D) -> void:
	entered_area(area)


func _on_area_exited(area: Area2D) -> void:
	exited_area(area)

extends Node2D

@onready var player = $CharacterBody2D
@onready var spawn = get_node(Global.next_spawn_door)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var spawn_offset: Vector2
	
	print(spawn.global_position)
	
	if spawn.door_position_in_room == "top":
		spawn_offset = Vector2(0, 30)
	elif spawn.door_position_in_room == "bottom":
		spawn_offset = Vector2(0, 0)
	else:
		print_debug("Door position not specified. position expected: top or bottom when position name " + str(spawn.door_position_in_room) + " was given")
	
	player.global_position = spawn.global_position + spawn_offset

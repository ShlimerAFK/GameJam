extends Node2D

@onready var player = $CharacterBody2D
@onready var spawn = get_node(Global.next_spawn_door)
@onready var inventory = $GUI/InventoryText
# Called when the node enters the scene tree for the first time.

@onready var sanity_layers := [$Tilemaps/Sanity1, $Tilemaps/Sanity2, $Tilemaps/Sanity3, $Tilemaps/Sanity4, $Tilemaps/Sanity5, $Tilemaps/Sanity6] 

var sanity_states = GlobalSanity.sanity_states
	
func _ready() -> void:
	
	#GlobalTimeLoop.narr_timeout.connect(_on_narr_timer_timeout)
	
	var spawn_offset: Vector2
	
	if spawn.door_position_in_room == "top":
		spawn_offset = Vector2(0, 30)
	elif spawn.door_position_in_room == "bottom":
		spawn_offset = Vector2(0, 0)
	else:
		print_debug("Door position not specified. position expected: top or bottom when position name " + str(spawn.door_position_in_room) + " was given")
	
	if Global.is_first_spawn:
		player.global_position = Vector2(0,0)
		Global.is_first_spawn = false
	else:
		player.global_position = spawn.global_position + spawn_offset
	
	display_sanity_state_layers()
	
func display_sanity_state_layers():
	var current_sanity_state = GlobalSanity.get_sanity_state()
	for i in range(sanity_states):
		if i <= current_sanity_state - 1:
			sanity_layers[i].visible = true
		elif i > current_sanity_state - 1:
			sanity_layers[i].visible = false

#TEMPORARY, REMOVE LATER
#func _input(event: InputEvent) -> void:	
	#if event.is_action_pressed("1"):
		#GlobalSanity.decrease_sanity(5)
		#display_sanity_state_layers()
		#
	#elif event.is_action_pressed("2"):
		#GlobalSanity.increase_sanity(5)
		#display_sanity_state_layers()

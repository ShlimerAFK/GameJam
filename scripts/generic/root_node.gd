extends Node2D

@onready var player = $CharacterBody2D
@onready var spawn = get_node(Global.next_spawn_door)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player.global_position = spawn.global_position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

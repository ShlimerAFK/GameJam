extends Node2D

@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D

@export var starts_at_state: int = 5
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var sanity_state = GlobalSanity.get_sanity_state()
	if sanity_state >= starts_at_state:
		audio_stream_player_2d.play()
	else:
		audio_stream_player_2d.stop()

	
		

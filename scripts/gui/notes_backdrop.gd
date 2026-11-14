extends Note

@onready var audio_player: AudioStreamPlayer = $AudioStreamPlayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	setup()

func define_hideable():
	hideable = $"."
	
func play_sfx():
	audio_player.play()

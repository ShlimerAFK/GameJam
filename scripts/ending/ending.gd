extends Control

var file = "ending.json"

@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer
@onready var timer: Timer = $Timer
@onready var narratio_node = $NarrationNode
@onready var sfx_timer: Timer = $SfxTimer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var sanity_state = GlobalSanity.get_sanity_state()
	var ending_dialog : String
	if sanity_state <= 3:
		ending_dialog = "ending_1"
		timer.start(10)
	else:
		ending_dialog = "ending_2"
		sfx_timer.start(3)
	
	narratio_node.start_narration(ending_dialog, file)
	
	await audio_stream_player.finished
	timer.start(3)

func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")


func _on_sfx_timer_timeout() -> void:
	audio_stream_player.play()

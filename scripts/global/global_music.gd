extends Node2D

@onready var music_player: AudioStreamPlayer = $MusicPlayer

var music_index

func _ready() -> void:
	music_index = AudioServer.get_bus_index("Music")
	print(music_index)

func connect_to_sanity():
	GlobalSanity.decreased_sanity_state.connect(_on_decreased_sanity_state)
	GlobalSanity.increased_sanity_state.connect(_on_increased_sanity_state)

func set_volume(volume):
	AudioServer.set_bus_volume_db(music_index, volume)

func get_volume_from_sanity(sanity: int):
	var volume = round((100 - sanity)/2) - 50
	print(volume)
	
	return volume
func _on_decreased_sanity_state(sanity_state : int, sanity: int):
	
	if sanity_state >= 3 and music_player.playing == false:
		play_music()
		
	set_volume(get_volume_from_sanity(sanity))
	
func _on_increased_sanity_state(sanity_state : int, sanity: int):
	if sanity_state < 3 and music_player.playing == true:
		stop_music()
		
	set_volume(get_volume_from_sanity(sanity))

func play_music():
	music_player.play()

func stop_music():
	music_player.stop()

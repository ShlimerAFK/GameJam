extends AudioStreamPlayer

var random_number_generator = RandomNumberGenerator.new()

func play_sound_with_random_pitch(pitch_mod : float):
	var random_number = random_number_generator.randf_range(0.8, 1.2) + pitch_mod
	pitch_scale = random_number
	
	play()

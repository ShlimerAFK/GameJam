extends AudioStreamPlayer

var random_number_generator = RandomNumberGenerator.new()

func play_sound_with_random_pitch(pitch_mod : float, pitch_variation: float):
	var random_number = random_number_generator.randf_range(1 - pitch_variation, 1 + pitch_variation) + pitch_mod
	pitch_scale = random_number
	
	play()

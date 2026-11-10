extends Interactable

class_name MiniGame

func _process(_delta):
	if player_has_entered == true and Input.is_action_just_pressed("interact") and not Global.player_is_interacting:
		Global.player_is_interacting = true
		
		play_game()

func play_game():
	pass

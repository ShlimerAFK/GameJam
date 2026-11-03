extends Interactable


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("interact") and player_has_entered:
		print("ahhhhhhhhh")

extends Interactable

class_name NPC

var dialog = "dialog_1"

@onready var dialog_node = $"../GUI/DialogNode"

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("interact") and player_has_entered and Global.player_is_interacting == false:
		Global.player_is_interacting = true
		dialog_node.start_dialog(dialog)
		

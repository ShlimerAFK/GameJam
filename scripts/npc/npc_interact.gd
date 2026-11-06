extends Interactable

class_name NPC

var dialog := "dialog_1"
@export var file_name : String

@onready var dialog_node = $"../GUI/DialogNode"

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("interact") and player_has_entered and Global.player_is_interacting == false:
		Global.player_is_interacting = true
		dialog_node.start_dialog(dialog, file_name)
		


func _on_area_2d_area_entered(area: Area2D) -> void:
	entered_area(area)


func _on_area_2d_area_exited(area: Area2D) -> void:
	exited_area(area)

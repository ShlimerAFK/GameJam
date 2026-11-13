extends Interactable

@onready var padlock_gui = $"../GUI/PadLockNode"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("interact") and player_has_entered and Global.player_is_interacting == false:
		padlock_gui.on_interacted()


func _on_area_entered(area: Area2D) -> void:
	entered_area(area)


func _on_area_exited(area: Area2D) -> void:
	exited_area(area)

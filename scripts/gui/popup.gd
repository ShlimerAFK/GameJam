extends NinePatchRect

signal deleted

func _on_button_pressed() -> void:
	deleted.emit()
	queue_free()

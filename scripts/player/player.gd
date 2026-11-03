extends CharacterBody2D

var interactabe_object: RigidBody2D

func _on_area_2d_area_entered(area: Area2D) -> void:
	interactabe_object = area.get_parent()
	print(interactabe_object)


func _on_area_2d_area_exited(area: Area2D) -> void:
	if interactabe_object == area.get_parent():
		interactabe_object = null
		print(interactabe_object)

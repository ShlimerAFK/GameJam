extends ColorRect


func _process(delta: float) -> void:
	
	var sanity_value = 1 - (GlobalSanity.get_sanity() / 100.0)
	
	material.set_shader_parameter("sanity_value", sanity_value)

extends CanvasLayer

func _ready() -> void:
	$Label.text = ""

func show_lable() -> void:
	$Label.text = "press E to interact"

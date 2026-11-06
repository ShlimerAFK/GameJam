extends CanvasLayer

@onready var lable = $InteractText/MarginContainer/InteractText

func _ready() -> void:
	lable.text = ""

func show_lable() -> void:
	lable.text = "Press E to interact"

func hide_lable() -> void:
	lable.text = ""

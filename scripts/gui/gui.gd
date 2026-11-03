extends CanvasLayer

@onready var lable = $InteractText

func _ready() -> void:
	lable.text = ""

func show_lable() -> void:
	lable.text = "press E to interact"

func hide_lable() -> void:
	lable.text = ""

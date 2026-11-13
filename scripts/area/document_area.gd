extends MiniGame


# Called when the node enters the scene tree for the first time.
@onready var mini_game_4 = $"../GUI/MinigameControler/MarginContainer/NinePatchRect/MiniGame4"


# Called when the node enters the scene tree for the first time.

func _ready() -> void:
	instructions = "Press a buton to brew a cup"
	main_text = "Coffee machine"
	completes_quest = "coffee"
	button_text = ["Coffee", "Te", "Hot chokolet", "Decaf"]
	current_minigame = mini_game_4

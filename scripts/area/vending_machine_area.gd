extends MiniGame

@onready var button = $"../GUI/MinigameControler/MarginContainer/NinePatchRect/MiniGame2/Button"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	main_text = "Vending machine"
	instructions = "Fix the vending machine"
	current_minigame = $"../GUI/MinigameControler/MarginContainer/NinePatchRect/MiniGame2"
	button.button_down.connect(_on_button_pressed)
	button.button_up.connect(_on_button_released)
	
func _on_button_pressed():
	print("button pressed")

func _on_button_released():
	print("released")

func play_game():
	print("playing game")
	
func exit_game():
	Global.player_is_interacting = false
	minigame_screen.visible = false
	current_minigame.visible = false

func _on_area_entered(area: Area2D) -> void:
	entered_area(area)

func _on_area_exited(area: Area2D) -> void:
	exited_area(area)

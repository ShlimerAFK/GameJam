extends MiniGame

@onready var button = $"../GUI/MinigameControler/MarginContainer/NinePatchRect/MiniGame2/Button"
@onready var timer = $"../GUI/MinigameControler/MarginContainer/NinePatchRect/MiniGame2/ChargeUpTimer"
@onready var bar = $"../GUI/MinigameControler/MarginContainer/NinePatchRect/MiniGame2/ProgressBar"
@onready var hp_bar = $"../GUI/MinigameControler/MarginContainer/NinePatchRect/MiniGame2/HpBar"

@onready var normal_puch: AudioStreamPlayer2D = $NormalPuch
@onready var hard_punch: AudioStreamPlayer2D = $HardPunch


var max_hp = 1000
var current_hp = 1000

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	main_text = "Vending machine"
	instructions = "Fix the vending machine"
	current_minigame = $"../GUI/MinigameControler/MarginContainer/NinePatchRect/MiniGame2"
	
	button.button_down.connect(_on_button_pressed)
	button.button_up.connect(_on_button_released)
	
	timer.timeout.connect(_on_timeout)
	
	hp_bar.max_value = current_hp
	hp_bar.value = current_hp
	
func _on_button_pressed():
	timer.start(0.02)
	
func _on_button_released():
	timer.stop()
	current_hp -= pow(bar.value, 1.6)
	hp_bar.value = current_hp
	bar.value = 0
	
	if current_hp > 0:
		normal_puch.play()
	
	elif current_hp <= 0:
		hard_punch.play()
		exit_game()
		Global.add_completed_task("vending machine")
	
func _on_timeout():
	bar.value += 0.3

func play_game():
	if current_hp <= 0:
		current_hp = max_hp
		
func exit_game():
	Global.player_is_interacting = false
	minigame_screen.visible = false
	current_minigame.visible = false

func _on_area_entered(area: Area2D) -> void:
	entered_area(area)

func _on_area_exited(area: Area2D) -> void:
	exited_area(area)

extends Interactable

class_name MiniGame

var instructions : String
var main_text : String

var player_is_using_minigame := false
var completes_quest : String

@onready var mini_game_gui = $"../GUI/MinigameControler"
@onready var minigame_screen = $"../GUI/MinigameControler/MarginContainer"
@onready var main_text_lable = $"../GUI/MinigameControler/MarginContainer/NinePatchRect/MainText"
@onready var instructions_lable = $"../GUI/MinigameControler/MarginContainer/NinePatchRect/InstuctionsText"

func _process(_delta):
	if player_has_entered == true and Input.is_action_just_pressed("interact") and not Global.player_is_interacting:
		Global.player_is_interacting = true
		minigame_screen.visible = true
		player_is_using_minigame = true
		
		set_main_text()
		set_instructions_text()
		
		play_game()

func set_main_text():
	main_text_lable.text = main_text

func set_instructions_text():
	instructions_lable.text = instructions

func play_game():
	pass
	
func exit_game():
	Global.player_is_interacting = false
	minigame_screen.visible = false

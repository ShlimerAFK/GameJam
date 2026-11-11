extends Interactable

class_name MiniGame

var instructions : String
var main_text : String

var player_is_using_minigame := false
var completes_quest : String
var button_text : Array

@onready var mini_game_gui = $"../GUI/MinigameControler"
@onready var minigame_screen = $"../GUI/MinigameControler/MarginContainer"
@onready var main_text_lable = $"../GUI/MinigameControler/MarginContainer/NinePatchRect/MainText"
@onready var instructions_lable = $"../GUI/MinigameControler/MarginContainer/NinePatchRect/InstuctionsText"
@onready var button_1 = $"../GUI/MinigameControler/MarginContainer/NinePatchRect/MiniGame/Button1"
@onready var button_2 = $"../GUI/MinigameControler/MarginContainer/NinePatchRect/MiniGame/Button2"
@onready var button_3 = $"../GUI/MinigameControler/MarginContainer/NinePatchRect/MiniGame/Button3"
@onready var button_4 = $"../GUI/MinigameControler/MarginContainer/NinePatchRect/MiniGame/Button4"

func _process(_delta):
	if player_has_entered == true and Input.is_action_just_pressed("interact") and not Global.player_is_interacting:
		Global.player_is_interacting = true
		minigame_screen.visible = true
		player_is_using_minigame = true
		
		set_main_text()
		set_instructions_text()
		set_button_text()
		connect_buttons()
		
		play_game()

func set_main_text():
	main_text_lable.text = main_text

func set_instructions_text():
	instructions_lable.text = instructions
	
func set_button_text():
	button_1.text = button_text[0]
	button_2.text = button_text[1]
	button_3.text = button_text[2]
	button_4.text = button_text[3]
	
func connect_buttons():
	button_1.pressed.connect(button_1_on_pressed)
	button_2.pressed.connect(button_2_on_pressed)
	button_3.pressed.connect(button_3_on_pressed)
	button_4.pressed.connect(button_4_on_pressed)

func button_1_on_pressed():
	print("pressed1")

func button_2_on_pressed():
	print("pressed2")

func button_3_on_pressed():
	print("pressed3")
	
func button_4_on_pressed():
	print("pressed4")

func play_game():
	pass
	
func exit_game():
	Global.player_is_interacting = false
	minigame_screen.visible = false

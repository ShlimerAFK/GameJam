extends MiniGame

@onready var mini_game_1 = $"../GUI/MinigameControler/MarginContainer/NinePatchRect/MiniGame1"
@onready var button_1 = $"../GUI/MinigameControler/MarginContainer/NinePatchRect/MiniGame1/Button1"
@onready var button_2 = $"../GUI/MinigameControler/MarginContainer/NinePatchRect/MiniGame1/Button2"
@onready var button_3 = $"../GUI/MinigameControler/MarginContainer/NinePatchRect/MiniGame1/Button3"
@onready var button_4 = $"../GUI/MinigameControler/MarginContainer/NinePatchRect/MiniGame1/Button4"

@onready var notification = $"../GUI/NotificationControler"

@onready var coffie_pour: AudioStreamPlayer2D = $CoffiePour


func _ready() -> void:
	instructions = "Press a buton to brew a cup"
	main_text = "Coffee machine"
	completes_quest = "coffee"
	button_text = ["Coffee", "Te", "Hot chokolet", "Decaf"]
	current_minigame = mini_game_1
	
	set_button_text()
	connect_buttons()
	
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
	button_pressed(0)

func button_2_on_pressed():
	button_pressed(1)
	
func button_3_on_pressed():
	button_pressed(2)
	
func button_4_on_pressed():
	button_pressed(3)
	
func button_pressed(index):
	coffie_pour.play()
	Global.add_item_to_inventory(button_text[index])
	exit_game()
	notification.display_notification()
	
func _on_area_entered(area: Area2D) -> void:
	entered_area(area)


func _on_area_exited(area: Area2D) -> void:
	exited_area(area)

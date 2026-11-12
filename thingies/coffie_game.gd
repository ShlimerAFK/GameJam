extends MiniGame

# Called when the node enters the scene tree for the first time.

func _ready() -> void:
	instructions = "Press a buton to brew a cup"
	main_text = "Coffee machine"
	completes_quest = "coffee"
	button_text = ["Coffee", "Te", "Hot chokolet", "Decaf"]
	
func play_game():
	print("playing game")

func button_1_on_pressed():
	Global.add_item_to_inventory(button_text[0])
	exit_game()

func button_2_on_pressed():
	Global.add_item_to_inventory(button_text[1])
	exit_game()
	
func button_3_on_pressed():
	Global.add_item_to_inventory(button_text[2])
	exit_game()
	
func button_4_on_pressed():
	Global.add_item_to_inventory(button_text[3])
	exit_game()
	
func _on_area_entered(area: Area2D) -> void:
	entered_area(area)


func _on_area_exited(area: Area2D) -> void:
	exited_area(area)

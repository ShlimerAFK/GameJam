extends MiniGame


# Called when the node enters the scene tree for the first time.
@onready var mini_game_4 = $"../GUI/MinigameControler/MarginContainer/NinePatchRect/MiniGame4"
@onready var text_input = $"../GUI/MinigameControler/MarginContainer/NinePatchRect/MiniGame4/LineEdit"
@onready var label = $"../GUI/MinigameControler/MarginContainer/NinePatchRect/MiniGame4/Label"
@onready var notification_controler = $"../GUI/NotificationControler"

var correct_text = "Bob"

# Called when the node enters the scene tree for the first time.

func _ready() -> void:
	instructions = "Sign the document"
	main_text = "Document"
	completes_quest = "document"
	current_minigame = mini_game_4
	
	text_input.text_submitted.connect(_on_text_input_submitted)

func quest_needs_to_be_activated():
	var quest = Global.get_quest("document")
	
	if quest.quest_is_active:
		return false
	else:
		return true
	
func _on_text_input_submitted(text :String):
	label.text = text + "\n"
	check_if_text_matches(text)
	
func check_if_text_matches(text: String):
	if text.to_lower() == correct_text.to_lower():
		exit_game()
		Global.add_item_to_inventory("Jims papers")
		Global.add_completed_task("document")
		notification_controler.display_notification()
		
	
func _on_area_entered(area: Area2D) -> void:
	entered_area(area)


func _on_area_exited(area: Area2D) -> void:
	exited_area(area)

extends MiniGame

@onready var mini_game_3 = $"../GUI/MinigameControler/MarginContainer/NinePatchRect/MiniGame3"
var deleted_popups := 0
var amout_of_popups: int


func _ready() -> void:
	instructions = "Remove all the popups"
	main_text = "Todds computer"
	completes_quest = "popup"
	current_minigame = mini_game_3
	
	amout_of_popups = mini_game_3.get_children().size()

	get_all_popups()

func get_all_popups():
	for popup in mini_game_3.get_children():
		popup.deleted.connect(_on_deleted_popup)
		
func check_if_all_popups_are_deleted():
	if deleted_popups == amout_of_popups:
		Global.add_completed_task("popup")
		exit_game()

func _on_deleted_popup():
	deleted_popups += 1
	check_if_all_popups_are_deleted()
	
func _on_area_entered(area: Area2D) -> void:
	entered_area(area)


func _on_area_exited(area: Area2D) -> void:
	exited_area(area)

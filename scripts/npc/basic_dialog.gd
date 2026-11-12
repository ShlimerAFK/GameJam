extends Control

var file_path : String

@onready var dialog_lable: Label = $TextBox/MarginContainer/Label
@onready var quest_controler := $"../QuestControler"
@onready var inventory_controler := $"../InventoryText"
@onready var textbox: MarginContainer = $TextBox


var count := 0
var dialogues := []
var tween: Tween = null
var player_is_choosing := false
var amout_of_choises := 0
var current_file_name: String

func start_dialog(dialog: String, file_name: String) -> void:
	
	current_file_name = file_name
	file_path = "res://dialogs/" + current_file_name
	
	if not textbox.visible:
		textbox.visible = true
	
	dialogues = read_json_data(file_path).get(dialog, [])
	if dialogues.size() > 0:
		play_text_animation()
		count += 1
		
	else:
		textbox.visible = false

func start_new_dialog(index: int):
	player_is_choosing = false
	var new_dialog = dialogues[count -1]["options"][index]["dialog"]
	count = 0
	start_dialog(new_dialog, current_file_name)

func _process(delta: float) -> void:
	
	if Input.is_action_just_pressed("scroll_dialog") and count < len(dialogues) and player_is_choosing == false:
		play_text_animation()
		count += 1
	
	elif Input.is_action_just_pressed("1") and amout_of_choises >= 1 and player_is_choosing:
		start_new_dialog(0)
	
	elif Input.is_action_just_pressed("2") and amout_of_choises >= 2 and player_is_choosing:
		start_new_dialog(1)
	
	elif Input.is_action_just_pressed("3") and amout_of_choises >= 3 and player_is_choosing:
		start_new_dialog(2)
	
	elif Input.is_action_just_pressed("4") and amout_of_choises >= 4 and player_is_choosing:
		start_new_dialog(3)
	
	elif Input.is_action_just_pressed("5") and amout_of_choises >= 5 and player_is_choosing:
		start_new_dialog(4)
		
	elif Input.is_action_just_pressed("scroll_dialog") and count == len(dialogues) and player_is_choosing == false and textbox.visible == true:
		textbox.visible = false
		Global.player_is_interacting = false
		count = 0
		
		
func read_json_data(filepath):
	
	var file = FileAccess.open(file_path, FileAccess.READ)
	var data = file.get_as_text()
	file.close()
	
	var json := JSON.new()
	if json.parse(data) != OK:
		return{}
	return json.get_data()

func play_text_animation():
	
	var text: String
	
	if tween:
		tween.kill()
	
	if dialogues[count]["speaker"] == "you" or dialogues[count]["speaker"] == "You":
		player_is_choosing = true
		player_speaking(text)
	else:
		others_speaking(text)
	
func others_speaking(text: String):
	text = str(dialogues[count]["speaker"]) + ": " + str(dialogues[count]["text"])
	
	dialog_lable.text = text
	animate_lable(text)
	
	if dialogues[count].has("quest_name"):
		var quest = Global.get_quest(dialogues[count]["quest_name"])
		quest_controler.add_quest(quest)
	
	if dialogues[count].has("completes_quest"):
		print("COMPLEAT")
		Global.complete_quest(dialogues[count]["completes_quest"])
		quest_controler.display_active_quests()
		Global.clear_inventory()
		inventory_controler.print_inventory(Global.inventory)
	
func player_speaking(text: String):
	var has_item: bool
	var has_quest: bool
	
	amout_of_choises = 0

	for i in range(dialogues[count]["options"].size()):
		has_item = false
		has_quest = false
		
		if dialogues[count]["options"][i].has("needs_quest") or dialogues[count]["options"][i].has("needs_item"):
			
			if dialogues[count]["options"][i].has("needs_quest"):
				has_quest = Global.check_if_quest_is_activated(dialogues[count]["options"][i]["needs_quest"])
			if dialogues[count]["options"][i].has("needs_item"):
				has_item = Global.check_if_player_has_item(dialogues[count]["options"][i]["needs_item"])
			
			if has_quest or has_item:
				amout_of_choises += 1
		else:
			amout_of_choises += 1
	
	for i in range (amout_of_choises):
		text += str(i +1) + ". "
		text += str(dialogues[count]["options"][i]["text"])
		
		if not i == amout_of_choises - 1:
			text += "\n"
	
	dialog_lable.text = text
	
	animate_lable(text)

	
func animate_lable(text: String):
	var transition_length = text.length() * 0.02
	dialog_lable.visible_ratio = 0
	tween = get_tree().create_tween()
	tween.tween_property(dialog_lable, "visible_ratio", 1, transition_length)
	

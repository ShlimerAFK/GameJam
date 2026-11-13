extends Control

var correct_code := [1,2,3,4,5,6,7,8]

var inputed_numbers := []
var quest_name = "padlock"

@onready var padlock = $MarginContainer
@onready var code_lock_node = $"."
@onready var buttons_container = $MarginContainer/NinePatchRect/ButtonsContainer
@onready var code_input = $MarginContainer/NinePatchRect/CodeInput
@onready var quest_controler = $"../QuestControler"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide_pad_lock()
	connect_all_buttons()

func connect_all_buttons():
	for button in buttons_container.get_children():
		button.pressed.connect(_on_button_pressed.bind(button.text))

func on_interacted():
	padlock.visible = true
	code_lock_node.mouse_filter = MOUSE_FILTER_STOP
	activate_quest()
	
func activate_quest():
	if not Global.check_if_quest_is_activated(quest_name):
		Global.activate_quest(Global.get_quest(quest_name))
		quest_controler.display_active_quests()

func hide_pad_lock():
	padlock.visible = false
	code_lock_node.mouse_filter = MOUSE_FILTER_IGNORE
	
	
func _on_button_pressed(text: String):
	if text == "#":
		check_if_code_matches()
		
	elif text == "*":
		inputed_numbers.pop_back()
		update_shown_code()
		
	elif inputed_numbers.size() < correct_code.size():
		inputed_numbers.append(int(text))
		update_shown_code()
		
func update_shown_code():
	var text := ": "
	for number in inputed_numbers:
		text += str(number)
	
	code_input.text = text
	
func check_if_code_matches():
	if correct_code == inputed_numbers:
		hide_pad_lock()
		switch_scene()
	else:
		inputed_numbers = []
		update_shown_code()

func switch_scene():
	get_tree().change_scene_to_file("res://scenes/ending.tscn")
	
func _on_exit_button_pressed() -> void:
	hide_pad_lock()
	inputed_numbers = []
	update_shown_code()

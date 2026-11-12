extends Control

var file_path : String

@onready var narrator_lable: Label = $TextBox/MarginContainer/Label
@onready var textbox: MarginContainer = $TextBox


var count := 0
var dialogues = []
var tween: Tween = null
var current_file_name: String

func start_narration(dialog: String, file_name: String) -> void:
	
	Global.player_is_interacting = true
	
	current_file_name = file_name
	file_path = "res://narrations/" + current_file_name
	
	if not textbox.visible:
		textbox.visible = true
	
	dialogues = read_json_data(file_path).get(dialog, [])
	
	if dialogues.size() > 0:
		play_text_animation()
		count += 1
		
	else:
		textbox.visible = false

func _process(delta: float) -> void:
	
	if Input.is_action_just_pressed("scroll_dialog") and count < len(dialogues):
		play_text_animation()
		count += 1
		
	elif Input.is_action_just_pressed("scroll_dialog") and count == len(dialogues) and textbox.visible == true:
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
	
	narrate(text)
	
func narrate(text: String):
	text = str(dialogues[count]["speaker"]) + ": " + str(dialogues[count]["text"])
	
	narrator_lable.text = text
	animate_lable(text)
	
func animate_lable(text: String):
	var transition_length = text.length() * 0.05
	narrator_lable.visible_ratio = 0
	tween = get_tree().create_tween()
	tween.tween_property(narrator_lable, "visible_ratio", 1, transition_length)
	

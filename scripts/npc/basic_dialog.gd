extends Node

var file_path = "res://data/dialog.json"

@onready var dialog_lable: Label = $TextBox/MarginContainer/Label
@onready var textbox: MarginContainer = $TextBox


var count = 0
var dialogues = []
var tween: Tween = null

func start_dialog(dialog: String) -> void:
	textbox.visible = true
	
	dialogues = read_json_data(file_path).get(dialog, [])
	if dialogues.size() > 0:
		print("playing text animation?")
		play_text_animation()

func _process(delta: float) -> void:

	if Input.is_action_just_pressed("ui_accept") and count < len(dialogues) - 1:
		count += 1
		play_text_animation()
		
	elif Input.is_action_just_pressed("ui_accept") and count == len(dialogues) - 1:
		textbox.visible = false
		Global.player_is_interacting = false
		count = 0
		
func read_json_data(filepath):
	
	var file = FileAccess.open(file_path, FileAccess.READ)
	var data = file.get_as_text()
	file.close()
	
	var json = JSON.new()
	if json.parse(data) != OK:
		return{}
	return json.get_data()

func play_text_animation():
	
	if tween:
		tween.kill()
	dialog_lable.text = str(dialogues[count]["speaker"]) + ": " + str(dialogues[count]["text"])
	dialog_lable.visible_ratio = 0
	tween = get_tree().create_tween()
	tween.tween_property(dialog_lable, "visible_ratio", 1, 1)

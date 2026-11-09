extends Control


@onready var quests_lable = $TextBox/MarginContainer/QuestsLable
@onready var text_box = $TextBox

var text := ""
var tween: Tween = null

func _ready() -> void:
	display_active_quests()
	
func add_quest(input_quest: Dictionary):
	var quest = Global.get_quest(input_quest["name"])
	if quest.quest_is_active == false:
		Global.activate_quest(quest)
		
		display_active_quests()
	
func display_active_quests():
	
	var active_quests = Global.get_active_quests()
	
	if text_box.visible == false and active_quests.size() > 0:
		text_box.visible = true
	
	for i in range(active_quests.size()):
		text += active_quests[i].text
		
		if i < active_quests.size() - 1:
			text += "\n"
			
	quests_lable.text = text
		

func animate_lable(text: String):
	
	if tween:
		tween.kill()
		
	var transition_length = text.length() * 0.03
	quests_lable.visible_ratio = 0
	tween = get_tree().create_tween()
	tween.tween_property(quests_lable, "visible_ratio", 1, transition_length)

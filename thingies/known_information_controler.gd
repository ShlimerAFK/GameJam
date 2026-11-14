extends Note

@onready var lable = $TextBox/MarginContainer/InfoLable

func _ready() -> void:
	display_known_information()
	setup()

func define_hideable():
	hideable = $"."
# Called when the node enters the scene tree for the first time.
func display_known_information():
	var completed_quests = Global.get_completed_quests()
	var text : String
	
	for i in range(completed_quests.size()):
		text += str(completed_quests[i].completion_information)
		
		if i < completed_quests.size() -1:
			text += "\n"
			
	lable.text = text

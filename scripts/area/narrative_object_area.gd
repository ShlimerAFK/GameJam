extends Interactable

class_name InteractableObject

@export var filename: String
@export var narrations : Array = ["narr_1","narr_1","narr_1","narr_1","narr_1","narr_1"]

@onready var narration = $"../../GUI/NarrationNode"
@onready var object: InteractableObject = $"."

var file_path : String


func _ready() -> void:
	
	gui = $"../../GUI"
	
	file_path = "objects/" + filename
	
	print(file_path)
	
	object.area_entered.connect(_on_area_entered)
	object.area_exited.connect(_on_area_exited)
	
	setup()

func _process(delta: float) -> void:
	if player_has_entered == true and Input.is_action_just_pressed("interact") and not Global.player_is_interacting:
		var narr_option = get_dialog_from_sanity_state()
		narration.start_narration(narr_option, file_path)

func setup():
	pass

func get_dialog_from_sanity_state():
	var sanity_state = GlobalSanity.get_sanity_state()
	
	return narrations[sanity_state - 1]
	

func _on_area_entered(area: Area2D) -> void:
	entered_area(area)


func _on_area_exited(area: Area2D) -> void:
	exited_area(area)

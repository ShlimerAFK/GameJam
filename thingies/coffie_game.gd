extends MiniGame

# Called when the node enters the scene tree for the first time.

func _ready() -> void:
	instructions = "Press space to fill your cup of coffie"
	main_text = "Coffie"
	completes_quest = "coffie"
	
func play_game():
	print("playing game")

func _on_area_entered(area: Area2D) -> void:
	entered_area(area)


func _on_area_exited(area: Area2D) -> void:
	exited_area(area)

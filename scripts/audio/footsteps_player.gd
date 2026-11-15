extends AudioStreamPlayer

func _ready() -> void:
	GlobalSanity.decreased_sanity_state.connect(_on_decreased_sanity_state)
	GlobalSanity.increased_sanity_state.connect(_on_increased_sanity_state)

func _on_decreased_sanity_state(sanity_state: int, sanity: int):
	print(sanity_state)
	print(sanity)

func _on_increased_sanity_state(sanity_state: int, sanity: int):
	print(sanity_state)
	print(sanity)

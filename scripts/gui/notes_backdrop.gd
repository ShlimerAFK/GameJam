extends Note


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	setup()

func define_hideable():
	hideable = $"."

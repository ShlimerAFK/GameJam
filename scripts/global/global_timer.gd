extends Node

var timer = Timer.new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("ready")
	
	add_child(timer)
	timer.start(10)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

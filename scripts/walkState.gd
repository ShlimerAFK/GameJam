extends State

class_name WalkState

const SPEED = 400

func enter():
	print("entered walk state")
	
func exit():
	pass

func update(delta: float):
	pass

func physics_update(delta: float):
	var direction := Input.get_vector("left", "right", "up", "down")
	
	player.velocity = direction * SPEED
	
	player.move_and_slide()


func handle_input(event: InputEvent):
	pass

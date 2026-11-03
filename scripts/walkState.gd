extends MovementState

class_name MoveState

func enter():
	animation.play("walk")
	
func exit():
	pass

func update(delta: float):
	pass

func physics_update(delta: float):
	
	handle_movement(delta)
	
	player.move_and_slide()

func handle_input(event: InputEvent):
	if event.is_action_pressed("run"):
		state_machine.change_state("RunState")

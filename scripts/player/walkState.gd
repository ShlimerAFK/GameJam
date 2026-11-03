extends MovementState

class_name WalkState


func enter():
	animation.play("walk")


func handle_input(event: InputEvent):
	if event.is_action_pressed("run"):
		state_machine.change_state("RunState")

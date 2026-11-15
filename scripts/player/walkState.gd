extends MovementState

class_name WalkState



func enter():
	
	animations = ["walk_down", "walk_up", "walk_side"]
	facing_direction = ""
	
func handle_input(event: InputEvent):
	if event.is_action_pressed("run"):
		state_machine.change_state("RunState")

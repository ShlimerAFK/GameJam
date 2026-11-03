extends State

class_name IdleState

func enter():
	animation.play("idle")

func physics_update(delta: float):
	
	player.move_and_slide()

func handle_input(event: InputEvent):

	if event.is_action_pressed("up") or event.is_action_pressed("down") or event.is_action_pressed("left") or event.is_action_pressed("right"):
		state_machine.change_state("WalkState")
	elif event.is_action_pressed("run"):
		state_machine.change_state("RunState")

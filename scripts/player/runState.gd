extends MovementState

class_name RunState

func enter():
	animation.play("run")
	
	speed = 40000


func handle_input(event: InputEvent):
	if event.is_action_released("run") and not player.velocity == Vector2(0,0):
		state_machine.change_state("WalkState")
	elif event.is_action_released("run") and player.velocity == Vector2(0,0):
		state_machine.change_state("IdleState")

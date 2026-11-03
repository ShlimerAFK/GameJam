extends MovementState

class_name RunState

func enter():
	animation.play("run")
	
	speed = 40000
	
func exit():
	pass

func update(delta: float):
	pass

func physics_update(delta: float):
	
	handle_movement(delta)
	
	player.move_and_slide()

func handle_input(event: InputEvent):
	if event.is_action_released("run") and not player.velocity == Vector2(0,0):
		state_machine.change_state("WalkState")
	elif event.is_action_released("run") and player.velocity == Vector2(0,0):
		state_machine.change_state("IdleState")

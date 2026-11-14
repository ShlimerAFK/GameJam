extends State

class_name IdleState

var facing_direction := "down"

func enter():
	
	if facing_direction == "up":
		animation.play("idle_up")
		
	elif facing_direction == "left" or facing_direction == "right":
		animation.play("idle_side")
	
	elif facing_direction == "down":
		animation.play("idle_down")

func physics_update(delta: float):
	
	player.move_and_slide()

func handle_input(event: InputEvent):

	if event.is_action_pressed("up") or event.is_action_pressed("down") or event.is_action_pressed("left") or event.is_action_pressed("right"):
		state_machine.change_state("WalkState")
	elif event.is_action_pressed("run"):
		state_machine.change_state("RunState")


func _on_walk_state_changed_direction(direction: String) -> void:
	facing_direction = direction
	
func _on_run_state_changed_direction(direction: String) -> void:
	facing_direction = direction

extends State

class_name MovementState

@onready var idle_timer = $"../../IdleTimer"

var speed = 5000

var animations = ["walk_down", "walk_up", "walk_side"]

func physics_update(delta: float):
	
	handle_movement(delta)
	
	player.move_and_slide()


func handle_movement(delta: float):
	var direction := Input.get_vector("left", "right", "up", "down")
	
	if direction == Vector2(0.0 , 1.0):
		animation.play(animations[0])
	elif direction == Vector2(0.0 , -1.0):
		animation.play(animations[1])
	elif direction == Vector2(1.0 , 0.0) or direction == Vector2(-1.0 , 0):
		animation.play(animations[2])
	
	if player.velocity.x > 0:
		animation.flip_h = true
	elif player.velocity.x < 0:
		animation.flip_h = false
	
	player.velocity = direction * speed * delta
	
	if not player.velocity == Vector2(0,0)	:
		idle_timer.start(0.2)


func _on_idle_timer_timeout() -> void:

	state_machine.change_state("IdleState")

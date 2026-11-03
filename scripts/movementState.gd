extends State

class_name MovementState

@onready var idle_timer = $"../../IdleTimer"

var speed = 20000

func handle_movement(delta: float):
	var direction := Input.get_vector("left", "right", "up", "down")
	
	if player.velocity.x > 0:
		animation.flip_h = true
	elif player.velocity.x < 0:
		animation.flip_h = false
	
	player.velocity = direction * speed * delta
	
	if not player.velocity == Vector2(0,0)	:
		idle_timer.start(0.2)

func _on_idle_timer_timeout() -> void:
	
	state_machine.change_state("IdleState")

extends State

class_name RunState

const SPEED = 40000

@onready var idle_timer = $"../../IdleTimer"

func enter():
	print("entered run state")
	animation.play("run")
	
func exit():
	pass

func update(delta: float):
	pass

func physics_update(delta: float):
	var direction := Input.get_vector("left", "right", "up", "down")
	
	if player.velocity.x > 0:
		animation.flip_h = true
	elif player.velocity.x < 0:
		animation.flip_h = false
	
	player.velocity = direction * SPEED * delta
	
	player.move_and_slide()
	
	if not player.velocity == Vector2(0,0)	:
		idle_timer.start(0.2)

func handle_input(event: InputEvent):
	pass

func _on_idle_timer_timeout() -> void:
	
	state_machine.change_state("IdleState")

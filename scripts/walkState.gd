extends State

class_name WalkState

var speed = 20000

@onready var idle_timer = $"../../IdleTimer"

func enter():
	print("entered walk state")
	animation.play("walk")
	
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
	
	player.velocity = direction * speed * delta
	
	player.move_and_slide()
	
	if not player.velocity == Vector2(0,0)	:
		idle_timer.start(0.2)

func handle_input(event: InputEvent):
	if event.is_action_pressed("run"):
		speed = 40000
		animation.play("run")
		
	
	if event.is_action_released("run"):
		speed = 20000
		animation.play("walk")

func _on_idle_timer_timeout() -> void:
	
	state_machine.change_state("IdleState")

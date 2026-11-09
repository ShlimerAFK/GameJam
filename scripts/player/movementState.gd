extends State

class_name MovementState

@onready var idle_timer = $"../../IdleTimer"

var speed := 5000

var animations : PackedStringArray

signal changed_direction(direction: String)

var facing_direction := "down"

func physics_update(delta: float):
	
	handle_movement(delta)
	
	player.move_and_slide()


func handle_movement(delta: float):
	var direction := Input.get_vector("left", "right", "up", "down")
	
	if direction == Vector2(0.0 , 1.0) and not facing_direction == "down":
		animation.play(animations[0])
		changed_direction.emit("down")
		facing_direction = "down"
	elif direction == Vector2(0.0 , -1.0) and not facing_direction == "up":
		animation.play(animations[1])
		facing_direction = "up"
		changed_direction.emit("up")
	elif direction == Vector2(1.0 , 0.0) and not facing_direction == "right":
		animation.play(animations[2])
		facing_direction = "right"
		changed_direction.emit("right")
		
	elif direction == Vector2(-1.0 , 0) and not facing_direction == "left":
		animation.play(animations[2])
		facing_direction = "left"
		changed_direction.emit("left")
	
	if player.velocity.x > 0:
		animation.flip_h = true
	elif player.velocity.x < 0:
		animation.flip_h = false
	
	player.velocity = direction * speed * delta
	
	if not player.velocity == Vector2(0,0)	:
		idle_timer.start(0.2)


func _on_idle_timer_timeout() -> void:

	state_machine.change_state("IdleState")

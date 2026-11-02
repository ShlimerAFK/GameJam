extends Node

class_name State
var state_machine: StateMachine

@onready var animation = $"../../AnimatedSprite2D"
@onready var player = $"../.."

func enter():
	pass
	
func exit():
	pass

func update(delta: float):
	pass

func physics_update(delta: float):
	pass

func handle_input(event: InputEvent):
	pass

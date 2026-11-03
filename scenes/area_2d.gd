extends Area2D
@onready var fade: CanvasLayer = $"."




var player_has_entered: bool

func _ready():
	player_has_entered = false


func _on_body_entered(body):
	player_has_entered = true
	#print("entered") just used to check if the player entered collision

func _on_body_exited(body):
	player_has_entered = false
	#print("exit") just used to check if the player is not in the collision

func _process(_delta):
	if player_has_entered == true:
		if Input.is_action_just_pressed("interact"):
			get_tree().change_scene_to_file("res://scenes/roomTest2.tscn")

	

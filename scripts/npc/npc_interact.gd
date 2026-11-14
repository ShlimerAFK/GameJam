extends Interactable

class_name NPC

var dialog := "dialog_1"
@export var file_name : String
@export var pitch_mod: float = 0

@onready var dialog_node = $"../GUI/DialogNode"
@onready var animation = $AnimatedSprite2D
@onready var area = $Area2D

func _ready() -> void:
	animation.play("idle")
	area.area_entered.connect(_on_area_2d_area_entered)
	area.area_exited.connect(_on_area_2d_area_exited)

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("interact") and player_has_entered and Global.player_is_interacting == false:
		Global.player_is_interacting = true
		dialog_node.start_dialog(dialog, file_name, pitch_mod)

		

func _on_area_2d_area_entered(area: Area2D) -> void:
	entered_area(area)


func _on_area_2d_area_exited(area: Area2D) -> void:
	exited_area(area)

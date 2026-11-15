extends Node2D
@export var transition_type: String
@export var duration: float
@export var scene_destination: String

@onready var color_rect: ColorRect = $CanvasLayer/ColorRect
@onready var animation_player: AnimationPlayer = $CanvasLayer/AnimationPlayer
@onready var main_menu: Node2D = $"."

func  _ready() -> void:
	animation_player.play("fade_in")

func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/office_1.tscn")


func _on_settings_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/settings.tscn")


func _on_exit_pressed() -> void:
	get_tree().quit()

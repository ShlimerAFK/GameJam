extends Control

@onready var label: Label = $MarginContainer/MarginContainer/Label
@onready var notification_controler: Control = $"."

@onready var timer: Timer = $Timer

var tween: Tween = null
var text = "New information added to notes"

func _ready() -> void:
	notification_controler.visible = false
	
func display_notification():

	notification_controler.visible = true
	label.text = text
	
	animate_lable(text, "open")
	timer.start(3)

func animate_lable(text: String, action: String):
	var ratio_destination
	
	if action == "close":
		ratio_destination = 0
		label.visible_ratio = 1
		
	elif action == "open":
		ratio_destination = 1
		label.visible_ratio = 0
	
	if tween:
		tween.kill()
	
	var transition_length = text.length() * 0.01
	tween = get_tree().create_tween()
	tween.tween_property(label, "visible_ratio", ratio_destination, transition_length)
	
	await tween.finished
	if action == "close":
		notification_controler.visible = false


func _on_timer_timeout() -> void:
	animate_lable(text, "close")

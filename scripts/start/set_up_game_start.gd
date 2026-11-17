extends Node2D

@onready var narration = $"../GUI/NarrationNode"
@onready var player: CharacterBody2D = $"../CharacterBody2D"
@onready var animation_player: AnimationPlayer = $CanvasLayer/AnimationPlayer
@onready var timer: Timer = $Timer
@onready var quest_controler :Control = $"../GUI/QuestControler"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	if Global.is_first_load:
		
		#GlobalTimeLoop.start_time_loop_timer()
		#GlobalTimeLoop.start_narr_timer()
		
		GlobalTimeLoop.start_Sanity_timer()
		
		GlobalMusic.connect_to_sanity()

		play_narration("narr_1")

		animation_player.play("fade_in")
		Global.is_first_load = false
		
		await animation_player.animation_finished
		
		timer.start(1)
		
	else:
		animation_player.play("nothing")
		
	
func play_narration(narr: String):
	if GlobalTimeLoop.day == 1:
		narration.start_narration(narr, "day_1.json")
		
	else:
		narration.start_narration(narr, "other_days.json")


func _on_timer_timeout() -> void:
	
	quest_controler.add_quest(Global.get_quest("boss"))

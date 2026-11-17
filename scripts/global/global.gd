extends Node

var player_is_interacting : bool
var next_spawn_door := "Door1"
var is_first_spawn := true
var is_first_load := true


# Tasks
var completed_tasks := []

func add_completed_task(task_name: String):
	completed_tasks.append(task_name)
	
func check_if_player_has_completed_task(task_name: String) -> bool:
	var task = task_name.to_lower()
	var has_completed_task = false
	
	for i in range(completed_tasks.size()):
		if completed_tasks[i].to_lower() == task:
			has_completed_task = true
	
	return has_completed_task
		

# Inventory
signal inventory_changed(Arrey)
var inventory := []

func add_item_to_inventory(item: String):
	inventory = []
	inventory.append(item)
	
	inventory_changed.emit(inventory)
	
func check_if_player_has_item(input_item: String) -> bool:
	var item = input_item.to_lower()
	var has_item_in_inventory = false
	for i in range(inventory.size()):
		if inventory[i].to_lower() == item:
			has_item_in_inventory = true
	
	if has_item_in_inventory:
		return true
	else:
		return false
	
func clear_inventory():
	inventory = []
# QUESTS _________________________________________


var quests := [
	
	{
		"name": "coffee",
		"text": "Dan: Get Dan a cup of coffee",
		"quest_is_active": false,
		"quest_is_done": false,
		"needs_to_complete_quest": "item",
		"completion_information" : "The boss turned Fifty last monday"
	},
	{
		"name": "padlock",
		"text": "Find the code to the padlock",
		"quest_is_active": false,
		"quest_is_done": false
	},
	{
		"name": "vending machine",
		"text": "Janet: Fix the vending machine",
		"quest_is_active": false,
		"quest_is_done": false,
		"needs_to_complete_quest": "task",
		"completion_information" : "The boss started working here 1963"
	},
	{
		"name": "popup",
		"text": "Todd: Remove the popups on Todds second computer",
		"quest_is_active": false,
		"quest_is_done": false,
		"needs_to_complete_quest": "task",
		"completion_information" : "The boss has tree kids"
	},
	{
		"name": "papers",
		"text": "Stephanie: Get Jim's papers from his desk",
		"quest_is_active": false,
		"quest_is_done": false,
		"needs_to_complete_quest": "item",
		"completion_information" : "The order of the code is his birthmonth then his wifs \n birth year and lastly how many years he as worked here"
	},
	{
		"name": "document",
		"text": "Jim: Sighn Jims document for him",
		"quest_is_active": false,
		"quest_is_done": false,
		"needs_to_complete_quest": "task",
		"completion_information" : "The bosses wife is fifty five years old"
	},
	{
		"name": "boss",
		"text": "Take the elevator to the bosses office",
		"quest_is_active": false,
		"quest_is_done": false,
		"needs_to_complete_quest": "task",
		"completion_information" : ""
	}
]

func get_quest(quest_name: String):
	for i in range(quests.size()):

		if quests[i].name.to_lower() == quest_name.to_lower():
			return quests[i]

	print_debug("error: found no quest with that name")
	return { "error": "found no quest with that name" }
	
func activate_quest(input_quest: Dictionary):
	
	var quest = get_quest(input_quest.name)
	
	if quest.quest_is_active == false and quest.quest_is_done == false:
		quest.quest_is_active = true


func get_active_quests():
	var active_quests = []
	for i in range(quests.size()):
		if quests[i].quest_is_active == true:
			active_quests.append(quests[i])
			
	return active_quests

func reset_active_quests():
	for i in range(quests.size()):
		quests[i].quest_is_active = false
		
func check_if_quest_is_activated(name: String) -> bool:
	var quest = get_quest(name)
	
	if quest.quest_is_active:
		return true
	else: 
		return false

func complete_quest(name: String):
	var quest = get_quest(name)
	quest.quest_is_done = true
	quest.quest_is_active = false
	
func get_completed_quests() -> Array:
	var completed_quests := []
	
	for i in range(quests.size()):
		if quests[i].quest_is_done == true:
			completed_quests.append(quests[i])
			
	return completed_quests
	

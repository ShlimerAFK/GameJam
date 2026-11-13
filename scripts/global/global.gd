extends Node

var player_is_interacting : bool
var next_spawn_door := "Door1"


# Tasks
var completed_tasks := []

func add_competed_task(task_name: String):
	completed_tasks.append(task_name)
	
func check_if_player_has_completed_task(task_name: String) -> bool:
	var task = task_name.to_lower()
	var has_completed_task = false
	
	for i in range(completed_tasks.size()):
		if completed_tasks[i].to_lower() == task:
			has_completed_task = true
	
	print(completed_tasks)
	
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
		"text": "Get dan a cup of coffee",
		"quest_is_active": false,
		"quest_is_done": false
	},
	{
		"name": "padlock",
		"text": "Find the code to the padlock",
		"quest_is_active": false,
		"quest_is_done": false
	},
	{
		"name": "vending machine",
		"text": "Finx the vending machine",
		"quest_is_active": false,
		"quest_is_done": false
	},
	{
		"name": "popup",
		"text": "Remove Todds popups",
		"quest_is_active": false,
		"quest_is_done": false
	},
	{
		"name": "papers",
		"text": "Get Jim's papers from his desk",
		"quest_is_active": false,
		"quest_is_done": false
	}
	,
	{
		"name": "document",
		"text": "Write Stephanie's document",
		"quest_is_active": false,
		"quest_is_done": false
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

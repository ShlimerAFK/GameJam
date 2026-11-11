extends Node

var player_is_interacting := false
var next_spawn_door := "Door1"
var inventory := []


# Inventory
signal inventory_changed(Arrey)

func add_item_to_inventory(item: String):
	#var has_item_in_inventory = false
	#for i in range(inventory.size()):
		#if inventory[i] == item:
			#has_item_in_inventory = true
	#
	#if not has_item_in_inventory:
	inventory = []
	inventory.append(item)
	
	inventory_changed.emit(inventory)
	

# QUESTS _________________________________________

var quests := [
	
	{
		"name": "coffie",
		"text": "Get dan a cup of coffie",
		"quest_is_active": false,
		"quest_is_done": false
	}	
]

func get_quest(quest_name: String):

	for i in range(quests.size()):
		if quests[i].name == quest_name:
			return quests[i]
		
		else:
			return { "error": "found quest with that name" }

	return {}
	
func activate_quest(input_quest: Dictionary):
	
	var quest = get_quest(input_quest.name)
	
	if quest.quest_is_active == false:
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

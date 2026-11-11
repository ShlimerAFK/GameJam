extends Control

@onready var lable = $TextBox/MarginContainer/Label
@onready var text_box = $TextBox

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.inventory_changed.connect(_on_inventory_changed)

func _on_inventory_changed(inventory):
	print_inventory(inventory)
	
func print_inventory(inventory: Array):
	if inventory.size() > 0:
		text_box.visible = true
	else:
		text_box.visible = false
	
	var text := ""
	for i in range(inventory.size()):
		text += str(inventory[i])
		if i < inventory.size() - 1:
			text += "\n"
			
	lable.text = text

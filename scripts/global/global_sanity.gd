extends Node

var sanity := 100

var sanity_states := 6

signal decreased_sanity_state
signal increased_sanity_state

func increase_sanity(value: int):
	if sanity + value > 100:
		sanity = 100
	else:
		sanity += value
		
	increased_sanity_state.emit(get_sanity_state(), get_sanity())
	
func decrease_sanity(value: int):
	
	if sanity - value < 0:
		sanity = 0
	else:
		sanity -= value
	
	decreased_sanity_state.emit(get_sanity_state(), get_sanity())
		
func get_sanity():
	return sanity
	
func get_sanity_state() -> int:
	if sanity >= 90:
		return 1
	elif sanity < 90 and sanity >= 70:
		return 2
	elif sanity < 70 and sanity >= 50:
		return 3
	elif sanity < 50 and sanity >= 30:
		return 4
	elif sanity < 30 and sanity >= 10:
		return 5
	elif sanity < 10:
		return 6
	
	return -1

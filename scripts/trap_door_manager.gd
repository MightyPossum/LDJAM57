extends Node2D

var door_open_check : bool = false

func _ready() -> void:
	%ClickArea.manager = self
	%trapdoorarea.manager = self
	%closingArea.manager = self

func open_door() -> void:
	# Called when the door is opened
	print("Door opened!")
	door_open_check = true
	%TrapdoorAnimation.play("trap_door_open")

func close_door() -> void:
	# Called when the door is closed
	print("Door closed!")
	door_open_check = false
	%TrapdoorAnimation.play("trap_door_close")

func is_door_open() -> bool:
	# Called to check if the door is open
	print("Checking if door is open")
	return door_open_check

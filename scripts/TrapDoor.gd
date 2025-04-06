extends Area2D

var allow_trapdoor_opening : bool = false

var manager : Node2D = null

func _on_body_entered(body: Node) -> void:
	# Called when a body enters the area.
	print("Body entered trapdoor: ", body.name)

	allow_trapdoor_opening = true
	
func _on_body_exited(body: Node) -> void:
	# Called when a body exits the area.
	print("Body exited trapdoor: ", body.name)
	
	allow_trapdoor_opening = false

func _input(_event):
	if Input.is_action_just_released("door_open") and allow_trapdoor_opening and not GLOBAL.GAME_MANAGER.game_over:
		print("Door open action triggered")
		manager.open_door()

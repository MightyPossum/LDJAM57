extends Area2D

var manager : Node2D = null

func _on_body_entered(body: Node) -> void:
	# Called when a body enters the area.
	print("Body entered trapdoor: ", body.name)

	if not manager.is_door_open():
		body.lose_game()
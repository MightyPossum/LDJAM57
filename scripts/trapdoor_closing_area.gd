extends Area2D


var manager : Node2D = null

func _on_body_entered(body: Node) -> void:
	# Called when a body enters the area.
	print("CLOSING AREA: Body entered trapdoor: ", body.name)

	manager.close_door()
	GLOBAL.GAME_MANAGER.score()
	%Hint.visible = false

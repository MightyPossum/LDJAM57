extends Node2D

var game_time : int = 0
var game_score : int = 0

var game_over : bool = false
var player : Node2D = null

func _on_transporter_area_body_entered(body:Node2D) -> void:
	print("Body entered transporter area: ", body.name)
	body.position.y = 0

func _ready() -> void:
	%Player.manager = self
	GLOBAL.GAME_MANAGER = self

func _process(_delta: float) -> void:
	
	GLOBAL.HUD.set_timer_text(game_time)
	GLOBAL.HUD.set_score_text(game_score)

func score() -> void:
	# Called to increase the score
	game_score += 1
	print("Score: ", game_score)

func lose_game() -> void:
	# Called when the player loses the game
	game_over = true
	print("Game Over")
	GLOBAL.HUD.enable_retry_text()
	%Audio.play()

func _input(_event):
	if Input.is_action_just_released("retry"):
		print("Retry action triggered")
		game_time = 0
		%Player.game_time = 0
		game_score = 0
		game_over = false
		GLOBAL.HUD.set_timer_text(game_time)
		GLOBAL.HUD.set_score_text(game_score)
		%Player.game_over = false
		%Player.position.y = 0
		%Player.velocity = Vector2(0, 0)
		GLOBAL.HUD.disable_retry_text()

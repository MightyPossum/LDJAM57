extends Control

func _ready() -> void:
	GLOBAL.HUD = self
	
func set_timer_text(time: int) -> void:
	# Called to set the timer text
	var seconds : int = time % 60
	var minutes : int = time / 60
	%GameTimeLabel.text = "%02d:%02d" % [minutes, seconds]

func set_score_text(score: int) -> void:
	# Called to set the score text
	%GameScoreLabel.text = str(score)

func enable_retry_text() -> void:
	%DeathText.visible = true

func disable_retry_text() -> void:
	%DeathText.visible = false

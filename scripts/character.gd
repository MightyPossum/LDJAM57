extends CharacterBody2D

var game_time : float = 0.0
var rounded_game_time : int = 0
var game_over : bool = false

var last_time_velocity_increased : int = 0

var manager : Node2D = null

func _ready() -> void:
	# Called when the node is added to the scene for the first time.
	# Use this function to initialize any variables or state.
	print("Character is ready!")
	%AnimationPlayer.play("falling")

func _physics_process(_delta: float) -> void:
	# Called every frame. 'delta' is the elapsed time since the previous frame.
	# Use this function to handle physics-related tasks.
	if game_time == 0:
		print("Game started!")
		print("Initial velocity: ", velocity)
		velocity = Vector2(0, 20)

	if not game_over:
		game_time += _delta
		rounded_game_time = int(game_time)
		manager.game_time = rounded_game_time
	
	if rounded_game_time%5 == 0 and rounded_game_time != last_time_velocity_increased and not game_over:
		last_time_velocity_increased = rounded_game_time
		print("5 seconds have passed!")
		print("Increasing velocity")
		print("Current velocity: ", velocity)
		velocity = Vector2(0, velocity.y + 20)
	
	move_and_slide()

func lose_game() -> void:
	# Called when the character loses the game
	print("Game over!")
	game_over = true
	manager.lose_game()
	velocity = Vector2(0, 0)
	GLOBAL.GAME_MANAGER.player = self

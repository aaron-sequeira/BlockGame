extends Node2D

@onready var spawn_timer = $SpawnTimer
@onready var block_scene = preload("res://block.tscn")
@onready var game_over_ui = $GameOverUI
enum GameState {	 PLAYING, GAME_OVER }

var state = GameState.PLAYING	

func _ready():
	print("MAIN RUNNING")

	spawn_timer.wait_time = 1.0
	spawn_timer.start()

	spawn_timer.timeout.connect(spawn_block)

func game_over():
	print("Game over")
	state = GameState.GAME_OVER
	get_tree().paused = true
	game_over_ui.visible = true

func spawn_block():
	if state != GameState.PLAYING:
		print("Game Over")
		return
	
	print("BLOCK SPAWNED")

	var block = block_scene.instantiate()
	add_child(block)

	block.position = Vector2(
		randi_range(50, 400),
		-50
	)

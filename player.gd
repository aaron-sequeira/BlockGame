extends CharacterBody2D

func _ready() -> void:
	print("Player spawned")

@export var speed = 300

func _physics_process(delta):
	for body in $Hitbox.get_overlapping_bodies():
		if body.name == "Block":
			print("BLOCK HIT DETECTED")
			get_tree().current_scene.game_over()
	var direction = 0
	if Input.is_action_pressed("ui_left"):
		direction -= 1
	if Input.is_action_pressed("ui_right"):
		direction += 1

	velocity.x = direction * speed
	move_and_slide()
	
func _on_body_entered(body):
	if body.name == "Block":
		get_parent().game_over()


func _on_hitbox_body_entered(body: Node2D) -> void:
	print("Hit detected:",body.name)
	if body.name == "block":
		get_parent().game_over()

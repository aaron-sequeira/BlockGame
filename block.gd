extends CharacterBody2D

@export var fall_speed = 200

func _physics_process(delta):
	velocity.y = fall_speed
	move_and_slide()

	if position.y > 900:
		queue_free()

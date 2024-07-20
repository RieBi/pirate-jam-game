extends Node
class_name ComponentPlayerMovement

@export var player: CharacterBody2D
@export var max_speed = 400

func _physics_process(delta: float) -> void:
	var velocity = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	print(velocity)
	player.velocity = velocity * max_speed
	
	player.move_and_slide()

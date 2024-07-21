extends Node
class_name ComponentPlayerShoot

@export var player: CharacterBody2D

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("shoot"):
		var projectile = preload("res://scenes/projectile/projectile.tscn").instantiate()
		projectile.position = player.global_position
		
		var mouse_pos = player.get_global_mouse_position()
		var proj_velocity = player.global_position.direction_to(mouse_pos)
		projectile.linear_velocity = proj_velocity * projectile.speed
		projectile.target_position = mouse_pos
		
		get_tree().root.add_child(projectile)

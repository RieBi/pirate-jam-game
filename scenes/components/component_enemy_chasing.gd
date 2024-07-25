extends Node

@export var speed = 100
@export var player: CharacterBody2D
@export var enemy: CharacterBody2D

func _ready() -> void:
	if not player:
		player = get_tree().get_first_node_in_group("player")

func _physics_process(delta: float) -> void:
	var direction = enemy.global_position.direction_to(player.global_position)
	direction *= speed
	
	enemy.velocity = direction
	enemy.move_and_slide()

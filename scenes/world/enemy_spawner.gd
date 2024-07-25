extends Node
class_name EnemySpawner

var shadelet_resource = preload("res://scenes/enemy/shadelet.tscn")

@export var player: CharacterBody2D

const shadelet_spawn_interval = 1

func _ready() -> void:
	setup_shadelet_timer()

func setup_shadelet_timer() -> void:
	var timer = Timer.new()
	timer.one_shot = false
	timer.wait_time = shadelet_spawn_interval
	timer.timeout.connect(spawn_shadelet)
	
	add_child(timer)
	timer.start()

func spawn_shadelet() -> void:
	var pos = get_random_position()
	var instance = shadelet_resource.instantiate() as CharacterBody2D
	instance.position = pos
	
	get_parent().add_child(instance)

func get_random_position() -> Vector2:
	var origin: Vector2 = -player.get_viewport_transform().origin
	var origin_max: Vector2 = origin + player.get_viewport_rect().size
	
	const max_margin = 500
	const fixed_padding = 60
	var combined_distance = max_margin + fixed_padding 
	
	var min_x_left = origin.x - combined_distance
	var max_x_left = origin.x - fixed_padding
	var min_x_right = origin_max.x + fixed_padding
	var max_x_right = origin_max.x + combined_distance
	var min_y_up = origin.y - combined_distance
	var max_y_up = origin.y - fixed_padding
	var min_y_down = origin_max.y + fixed_padding
	var max_y_down = origin_max.y + combined_distance
	
	var actual_x: int
	var actual_y: int
	
	if randi_range(0, 1) == 0:
		actual_x = randi_range(min_x_left, max_x_left)
	else:
		actual_x = randi_range(min_x_right, max_x_right)
	
	if randi_range(0, 1) == 0:
		actual_y = randi_range(min_y_up, max_y_up)
	else:
		actual_y = randi_range(min_y_down, max_y_down)
	
	var result_vector = Vector2(actual_x, actual_y)
	assert (result_vector < origin or result_vector > origin_max, "Enemy spawns outside screen")
	
	return result_vector

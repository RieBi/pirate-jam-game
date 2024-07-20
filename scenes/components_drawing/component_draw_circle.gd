extends Node2D
@export var radius: int
@export var color: Color

func _draw() -> void:
	draw_circle(Vector2.ZERO, radius, color)

extends Node2D
@export var max_health: int = 10
var health = max_health

@onready var label: Label = $Label

func _process(_delta: float) -> void:
	label.text = "Health: %s" % health

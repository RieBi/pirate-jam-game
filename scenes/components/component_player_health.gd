extends Node2D
@export var max_health: int = 10
var health = max_health

signal health_gone

@onready var label: Label = $Label

func _process(_delta: float) -> void:
	label.text = "Health: %s" % health

func damage(dmg: int):
	health -= dmg
	if health <= 0:
		health_gone.emit()

func heal(amount: int):
	health += amount
	health = clampi(health, 0, max_health)

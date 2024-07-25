extends CharacterBody2D


func _on_hitbox_body_entered(body: Node2D) -> void:
	add_child(preload("res://scenes/ui/death_screen.tscn").instantiate())

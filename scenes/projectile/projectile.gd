extends RigidBody2D

var speed: int = 200
var target_position: Vector2 = Vector2.ZERO

func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:
	const MARGIN_DISTANCE := 5
	if position.distance_to(target_position) <= MARGIN_DISTANCE:
		on_target_reached(state)

func on_target_reached(physics_state: PhysicsDirectBodyState2D) -> void:
	physics_state.linear_velocity = Vector2.ZERO
	
	create_tween().tween_interval(2).finished.connect(
		func(): 
		queue_free()
		)

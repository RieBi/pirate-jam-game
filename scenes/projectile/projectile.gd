extends RigidBody2D

var speed: int = 200
var target_position: Vector2 = Vector2.ZERO

func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:
	const MARGIN_DISTANCE := 5
	if position.distance_to(target_position) <= MARGIN_DISTANCE:
		state.linear_velocity = Vector2.ZERO

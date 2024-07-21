extends RigidBody2D

var speed: int = 200
var target_position: Vector2 = Vector2.ZERO
var is_target_reached = false

func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:
	const MARGIN_DISTANCE := 5
	if position.distance_to(target_position) <= MARGIN_DISTANCE:
		on_target_reached(state)

func on_target_reached(physics_state: PhysicsDirectBodyState2D) -> void:
	if is_target_reached:
		return
	is_target_reached = true
	physics_state.linear_velocity = Vector2.ZERO
	
	explode()
	await create_tween().tween_interval(2).finished
	queue_free()

func explode() -> void:
	$Sprite2D.queue_free()
	var particles = $Explosion/CPUParticles2D as CPUParticles2D
	particles.emitting = true
	
	var area = $Explosion/Area2D as Area2D
	
	for body in area.get_overlapping_bodies():
		if body.is_in_group("enemy"):
			body.queue_free()
			pass # Damage enemy

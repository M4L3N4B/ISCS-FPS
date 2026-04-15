extends CharacterBody3D

const SPEED = 50.0
var explosion_scene = preload("res://scenes/explosion.tscn")

func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	
	if collision:
		var collider = collision.get_collider()
		
		# Check if we hit an enemy
		if collider.has_method("take_damage"):
			collider.take_damage()
		
		# Spawn small impact explosion
		var explosion = explosion_scene.instantiate()
		explosion.scale = Vector3(0.3, 0.3, 0.3)
		explosion.is_death_explosion = false
		explosion.position = collision.get_position()
		get_parent().add_child(explosion)
		
		# Remove bullet on any collision
		queue_free()

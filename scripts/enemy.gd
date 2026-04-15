extends CharacterBody3D

var hp: int = 3
var explosion_scene = preload("res://scenes/explosion.tscn")

func take_damage():
	hp -= 1
	
	if hp <= 0:
		die()
	else:
		# Spawn small impact effect on hit (not death)
		var explosion = explosion_scene.instantiate()
		explosion.scale = Vector3(0.3, 0.3, 0.3)
		explosion.is_death_explosion = false
		explosion.position = position
		get_parent().add_child(explosion)

func die():
	# Spawn death explosion
	var explosion = explosion_scene.instantiate()
	explosion.scale = Vector3(2.0, 2.0, 2.0)
	explosion.is_death_explosion = true
	explosion.position = position
	get_parent().add_child(explosion)
	queue_free()

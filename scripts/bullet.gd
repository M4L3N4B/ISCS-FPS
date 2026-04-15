extends CharacterBody3D

const SPEED = 50.0

func _physics_process(delta):
	position += velocity * delta

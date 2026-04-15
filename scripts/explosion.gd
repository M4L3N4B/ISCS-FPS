extends MeshInstance3D

var is_death_explosion: bool = false

func _ready():
	var mat = StandardMaterial3D.new()
	mat.albedo_color = Color(1.0, 0.4, 0.0, 1.0) if not is_death_explosion else Color(1.0, 0.2, 0.0, 1.0)
	mat.emission_enabled = true
	mat.emission = Color(1.0, 0.3, 0.0) if not is_death_explosion else Color(1.0, 0.1, 0.0)
	mat.emission_energy_multiplier = 3.0
	material_override = mat
	
	scale = Vector3(0.1, 0.1, 0.1)
	
	var tween = create_tween()
	tween.set_parallel(true)
	
	if is_death_explosion:
		tween.tween_property(self, "scale", Vector3(3.0, 3.0, 3.0), 0.15)
		tween.tween_property(self, "scale", Vector3(0.1, 0.1, 0.1), 0.25).set_delay(0.1)
	else:
		tween.tween_property(self, "scale", Vector3(0.5, 0.5, 0.5), 0.1)
		tween.tween_property(self, "scale", Vector3(0.1, 0.1, 0.1), 0.15).set_delay(0.05)
	
	$Lifetime.start()

func _on_Lifetime_timeout():
	queue_free()
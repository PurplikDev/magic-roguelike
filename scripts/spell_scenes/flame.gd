extends Node2D

@onready var flame_particle = $ActiveRoot/FlameParticle

func _ready():
	flame_particle.emitting = true

func _on_flame_particle_finished():
	queue_free()

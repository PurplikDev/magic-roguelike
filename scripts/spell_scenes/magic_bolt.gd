extends Node2D

@onready var active_root = $ActiveRoot
@onready var explosion_particle = $ExplosionParticle

func _on_hurtbox_hit():
	self_destruct()

func _on_self_destruct_timer_timeout():
	self_destruct()

func self_destruct():
	active_root.process_mode = Node.PROCESS_MODE_DISABLED
	active_root.visible = false
	explosion_particle.emitting = true


func _on_explosion_particle_finished():
	queue_free()

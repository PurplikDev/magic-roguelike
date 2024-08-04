class_name SimpleMoveComponent
extends Node

@export var actor: Node2D
@export var direction: Vector2
@export var speed: StatComponent

func _physics_process(delta):
	actor.global_position += (direction.rotated(actor.rotation) * speed.value) * delta

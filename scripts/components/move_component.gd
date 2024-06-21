class_name MoveComponent
extends Node

@export var actor: Entity
@export var speed: float = 100
var direction: Vector2
var velocity: Vector2

func _physics_process(delta):
	if direction:
		velocity = lerp(velocity, direction * speed, actor.LERP_SPEED * delta)
	else:
		velocity = lerp(velocity, Vector2.ZERO, actor.LERP_SPEED * delta)
	
	actor.velocity = velocity
	actor.move_and_slide()

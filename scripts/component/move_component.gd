class_name MoveComponent
extends Node

@export var actor: Entity
@export var speed: StatComponent

var direction: Vector2
var velocity: Vector2
var lock_movement: bool

func _physics_process(delta):
	if direction && !lock_movement:
		velocity = lerp(velocity, direction * speed.value, actor.LERP_SPEED * delta)
	else:
		velocity = lerp(velocity, Vector2.ZERO, actor.LERP_SPEED * delta)
	
	actor.velocity = velocity
	actor.move_and_slide()

class_name KnockbackComponent
extends Node

@export var move_component: MoveComponent
@export var decay_strength: float

var knockback: Vector2 = Vector2.ZERO

func _physics_process(delta):
	knockback = lerp(knockback, Vector2.ZERO, decay_strength * delta)
	move_component.velocity += knockback

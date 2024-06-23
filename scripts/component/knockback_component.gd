class_name KnockbackComponent
extends Node

@export var actor: Entity
@export var move_component: MoveComponent
@export var decay_strength: float

var knockback: Vector2 = Vector2.ZERO
var stunned: bool

func _physics_process(delta):
	move_component.velocity += knockback
	if stunned && move_component.lock_movement && knockback.length() < 0.5:
		stunned = false
		move_component.lock_movement = false
	knockback = lerp(knockback, Vector2.ZERO, decay_strength * delta)

func apply_knockback(source_pos: Vector2, strength: float):
	knockback = actor.global_position.direction_to(source_pos) * (-5 * strength)
	stunned = true
	move_component.lock_movement = true

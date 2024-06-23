class_name Hurtbox
extends Area2D

@export var damage: float

var damage_source: DamageSource:
	get:
		var attacker: Entity = owner
		damage_source = DamageSource.new(attacker, global_position, damage)
		return damage_source

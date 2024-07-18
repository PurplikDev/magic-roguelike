class_name Hurtbox
extends Area2D

signal hit

@export var damage: float

var damage_source: DamageSource:
	get:
		damage_source = DamageSource.new(global_position, damage)
		return damage_source

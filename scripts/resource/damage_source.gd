class_name DamageSource
extends Resource

enum DamageType { MELE, FIRE, TRUE }

var attacker: Entity
var damage_source_pos: Vector2
var damage: float

func _init(p_attacker: Entity, p_damage_source_pos: Vector2, p_damage: float):
	attacker = p_attacker
	damage_source_pos = p_damage_source_pos
	damage = p_damage

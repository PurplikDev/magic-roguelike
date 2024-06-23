@tool
class_name Hitbox
extends Area2D

signal hit(damage_source: DamageSource)

@export var health_component: HealthComponent:
	set(value):
		health_component = value
		if Engine.is_editor_hint():
			update_configuration_warnings()

@export var knockback_component: KnockbackComponent

func _ready():
	area_entered.connect(_on_area_entered)

func _on_area_entered(area: Area2D):
	if area is Hurtbox:
		hit.emit(area.damage_source)
		health_component.damage(area.damage_source.damage)
		if knockback_component != null:
			knockback_component.apply_knockback(area.damage_source.damage_source_pos, area.damage_source.damage)

func _get_configuration_warnings():
	if health_component == null:
		return ["This node needs a Health Component assigned!"]
	return []

@tool
class_name Hitbox
extends Area2D

signal hit(damage_source: DamageSource)

@export var health_stat: StatComponent:
	set(value):
		health_stat = value
		if Engine.is_editor_hint():
			update_configuration_warnings()

@export var knockback_component: KnockbackComponent
@export var damage_flash_component: DamageFlashComponent

func _ready():
	area_entered.connect(_on_area_entered)

func _on_area_entered(area: Area2D):
	if area is Hurtbox:
		hit.emit(area.damage_source)
		area.hit.emit()
		health_stat.decrease(area.damage_source.damage)
		if knockback_component != null:
			knockback_component.apply_knockback(area.damage_source.damage_source_pos, area.damage_source.damage)
		if damage_flash_component != null:
			damage_flash_component.flash()

func _get_configuration_warnings():
	if health_stat == null:
		return ["This node needs a Health Stat assigned!"]
	return []

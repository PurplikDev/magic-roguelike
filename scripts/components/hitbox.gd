@tool
class_name Hitbox
extends Area2D

@export var health_component: HealthComponent:
	set(value):
		health_component = value
		if Engine.is_editor_hint():
			update_configuration_warnings()

func _ready():
	area_entered.connect(_on_area_entered)

func _on_area_entered(area: Area2D):
	if area is Hurtbox:
		pass

func _get_configuration_warnings():
	if health_component == null:
		return ["This node needs a Health Component assigned!"]
	return []

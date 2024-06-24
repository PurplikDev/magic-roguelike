class_name HealthComponent
extends Node

signal health_update(health: float)
signal max_health_update(max_health: float)
signal died

@export var max_health: float
var health

func _ready():
	health = max_health

func heal(heal_amount: float):
	health += heal_amount
	update_health()

func damage(damage_amount: float):
	health -= damage_amount
	update_health()

func update_health():
	health_update.emit(health)
	if health <= 0:
		died.emit()

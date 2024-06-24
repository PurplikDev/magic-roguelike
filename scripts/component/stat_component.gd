class_name StatComponent
extends Node

signal value_update(value: float)
signal max_value_update(max_value: float)
signal value_empty

@export var max_value: float
var value: float

func _ready():
	increase(max_value)

func increase(increase_amount: float):
	value += increase_amount
	update_value()

func decrease(decrease_amount: float):
	value -= decrease_amount
	update_value()

func set_max_value(p_value: float):
	max_value = p_value
	max_value_update.emit(max_value)
	if value > max_value:
		value = max_value
		update_value()

func update_value():
	value_update.emit(value)
	if value <= 0:
		value_empty.emit()

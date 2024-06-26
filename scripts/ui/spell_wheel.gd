class_name SpellWheel
extends Control

@onready var spell_elements = $SpellElements
@onready var spell_element = load("res://scenes/ui/elements/spell_element.tscn")

var spell_component: SpellCastingComponent
var scale_tween: Tween
var rotation_tween: Tween

func _process(_delta):
	if Input.is_action_just_pressed("spell_wheel"):
		wheel_show()
	if Input.is_action_just_released("spell_wheel"):
		wheel_hide()

func wheel_show():
	refresh_spells()
	effect(Vector2(1, 1), 0, 0.5)

func wheel_hide():
	effect(Vector2(0, 0), -180, 0.25)

func effect(p_scale: Vector2, p_rotation_degrees: float, time: float = 0.5):
	if scale_tween:
		scale_tween.kill()
	if rotation_tween:
		rotation_tween.kill()
	scale_tween = get_tree().create_tween()
	scale_tween.tween_property(spell_elements, "scale", p_scale, time).set_ease(Tween.EASE_OUT)
	rotation_tween = get_tree().create_tween()
	rotation_tween.tween_property(spell_elements, "rotation_degrees", p_rotation_degrees, time).set_ease(Tween.EASE_OUT)

func refresh_spells():
	for child in spell_elements.get_children():
		child.queue_free()
	
	for n in range(spell_component.spells.size()):
		var element = spell_element.instantiate()
		element.set_spell(spell_component.spells[n])
		spell_elements.add_child(element)
	
	calculate_rotation()

func calculate_rotation():
	var rotation_per_child: float = 360.0 / spell_elements.get_child_count()
	var current_index: int = 0
	
	var children = spell_elements.get_children()
	
	for child in children:
		if child is Control:
			child.rotation_degrees = (rotation_per_child * current_index) - 90
			current_index += 1

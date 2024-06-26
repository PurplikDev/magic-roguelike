extends Control

@onready var texture = $Texture

var size_tween: Tween
var scale_tween: Tween

var parent_rotation: float = 0
var spell: Spell
var is_single: bool = false

func _ready():
	texture.mouse_entered.connect(begin_effect)
	texture.mouse_exited.connect(end_effect)

func _process(_delta):
	if get_parent() != null && get_parent() is Control:
		parent_rotation = get_parent().rotation_degrees
	texture.rotation_degrees = (rotation_degrees * -1) - parent_rotation

func begin_effect():
	effect(Vector2(80, 0), Vector2(1.25, 1.25))

func end_effect():
	effect(Vector2(70, 0), Vector2(1, 1))

func effect(p_size: Vector2, p_scale: Vector2):
	if size_tween != null:
		size_tween.kill()
	
	if scale_tween != null:
		scale_tween.kill()
	
	if !is_single:
		size_tween = get_tree().create_tween()
		size_tween.tween_property(self, "size", p_size, 0.125).set_ease(Tween.EASE_OUT)
	
	scale_tween = get_tree().create_tween()
	scale_tween.tween_property(texture, "scale", p_scale, 0.125).set_ease(Tween.EASE_OUT)

func set_spell(p_spell: Spell):
	spell = p_spell
	$Texture.texture = p_spell.spell_icon
	$Texture/Label.text = p_spell.spell_name

func set_as_single():
	is_single = true
	size = Vector2(0, 0)

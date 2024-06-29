class_name InputComponent
extends Node

@export var actor: Entity

@export var move_component: MoveComponent
@export var animation_component: AnimationManagerComponent
@export var spell_casting_component: SpellCastingComponent
@export var interaction_component: InteractionComponent
@export var spell_wheel: SpellWheel
@export var camera: AnchoredCamera
@export var caster: Caster

func _physics_process(_delta):
	if move_component != null:
		move_component.direction = Input.get_vector("left", "right", "up", "down")
	
	if animation_component != null:
		animation_component.direction = Input.get_vector("left", "right", "up", "down")
	
	if interaction_component != null && Input.is_action_just_pressed("interact"):
		interaction_component.interact()
	
	if spell_casting_component != null:
		if Input.is_action_just_pressed("cast"):
			spell_casting_component.start_cast()
		if Input.is_action_just_released("cast"):
			spell_casting_component.stop_cast()
		
	if spell_wheel != null:
		if Input.is_action_just_pressed("spell_wheel"):
			spell_wheel.wheel_show()
		if Input.is_action_just_released("spell_wheel"):
			spell_wheel.wheel_hide()
	
	if camera != null:
		if Input.is_action_just_pressed("camera_zoom_in"):
			camera.zoom_in()
		if Input.is_action_just_pressed("camera_zoom_out"):
			camera.zoom_out()
	
	if caster != null:
		caster.look_at_pos = caster.get_global_mouse_position() 

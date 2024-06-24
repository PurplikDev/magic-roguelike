class_name InputComponent
extends Node

@export var actor: Entity

@export var move_component: MoveComponent
@export var animation_component: AnimationManagerComponent
@export var spell_casting_component: SpellCastingComponent
@export var interaction_component: InteractionComponent
@export var camera: AnchoredCamera

func _physics_process(_delta):
	if move_component != null:
		move_component.direction = Input.get_vector("left", "right", "up", "down")
	
	if animation_component != null:
		animation_component.direction = Input.get_vector("left", "right", "up", "down")
	
	if interaction_component != null && Input.is_action_just_pressed("interact"):
		interaction_component.interact()
	
	if spell_casting_component != null && Input.is_action_just_pressed("cast"):
		spell_casting_component.start_cast()
	
	if spell_casting_component != null && Input.is_action_just_released("cast"):
		spell_casting_component.stop_cast()
	
	if camera != null:
		if Input.is_action_just_pressed("camera_zoom_in"):
			camera.zoom_in()
		if Input.is_action_just_pressed("camera_zoom_out"):
			camera.zoom_out()

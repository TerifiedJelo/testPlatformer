extends CharacterBody2D

var bullet_scene = preload("res://scenes/bullet.tscn");

@export var speed = 500
@export var gravity = 30
@export var jump_force = 300

@export var ammo : PackedScene

func _physics_process(delta):
	#if !is_on_floor():
		#velocity.y += gravity
		#if velocity.y > 1000:
			#velocity.y = 1000
			
	#if Input.is_action_just_pressed("jump"): # && is_on_floor():
		#velocity.y = -jump_force
		
	if Input.is_action_just_pressed("shoot"):
		#var projectile = projectile_scene.instantiate();
		#get_parent().add_child(projectile);
		#projectile.position.x = global_position.x + 85;
		#projectile.position.y = global_position.y - 70;
		_shoot();
	
	var horizontal_direction = Input.get_axis("move_left", "move_right")
	velocity.x = speed * horizontal_direction;
	var vertical_direction = Input.get_axis("move_up", "move_down")
	velocity.y = speed * vertical_direction;
	move_and_slide()


func _shoot():
	var bullet = ammo.instantiate();
	bullet._set_owner("PLAYER");
	bullet.position = position;
	bullet.direction = (get_global_mouse_position() - bullet.position).normalized()
	get_tree().current_scene.add_child(bullet);

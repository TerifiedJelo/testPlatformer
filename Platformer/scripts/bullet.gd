extends Area2D

enum BulletOwner { PLAYER, ENEMY }

var direction : Vector2 = Vector2.RIGHT
var speed : float = 300
var bullet_owner = ""

func _physics_process(delta):
	position += direction * speed * delta;

########################################################################
#var target_position : Vector2 = get_global_mouse_position()
#var direction : Vector2 = (target_position - position).normalized()
#position += direction * speed * delta
########################################################################

func _on_screen_exited():
	queue_free();

func _set_owner(new_owner):
	bullet_owner = new_owner

func _on_area_entered(area):
	if area.name == "Player" and bullet_owner == "PLAYER":
		print("Collision with player bullet");
		#queue_free();
	elif bullet_owner == "ENEMY":
		print("Collision with enemy bullet");
		queue_free();

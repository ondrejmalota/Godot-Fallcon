extends RigidBody2D

signal scoring

var MOVE_SPEED = Utils.random_move_speed()
var ROTATE_SPEED = Utils.random_rotate_speed()


func _physics_process(delta):
	linear_velocity.y = MOVE_SPEED * delta
	angular_velocity = ROTATE_SPEED * delta



func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

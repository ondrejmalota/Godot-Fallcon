extends RigidBody2D

var SPEED = 300

func _physics_process(delta):
	position.y += SPEED * delta
	if get_tree().current_scene.name == "MainMenu":
		SPEED = 30


func _on_VisibilityNotifier2D_screen_entered():
	Utils.Spawn_Wall_Left()

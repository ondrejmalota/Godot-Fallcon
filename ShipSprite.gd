extends RigidBody2D

var right = true
var velocity = linear_velocity

const ExplosionEffect = preload("res://ExplosionEffect.tscn")

onready var sprite = $Sprite
onready var animation = $AnimationPlayer
onready var moveSound = $MoveSound


signal shipDestroyed


func _physics_process(delta):
	
	animation.play("Fly")
	
	if applied_force.x == 0:
		applied_force.x = 25000 * delta
		
	if Input.is_action_just_pressed("MOVE"):
		moveSound.play()
		if applied_force.x < 0:
			applied_force.x = 25000 * delta
		elif applied_force.x > 0:
			applied_force.x = -25000 * delta





func _on_ShipSprite_body_entered(body):
	yield(get_tree().create_timer(0.1), "timeout")
	Explosion()
	queue_free()
	emit_signal("shipDestroyed")

func Explosion():
	var explosionEffect = ExplosionEffect.instance()
	var Main = get_tree().current_scene
	Main.add_child(explosionEffect)
	explosionEffect.global_position = global_position


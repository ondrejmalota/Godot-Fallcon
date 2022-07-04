extends Node2D

const Asteroids = [
preload("res://Asteroid_1.tscn"),
preload("res://Asteroid_2.tscn"),
preload("res://Asteroid_3.tscn"),
preload("res://Asteroid_4.tscn"),
preload("res://Asteroid_5.tscn"),
preload("res://Asteroid_6.tscn"),
preload("res://Asteroid_7.tscn"),
preload("res://Asteroid_8.tscn"),
preload("res://Asteroid_9.tscn"),
preload("res://Asteroid_10.tscn")
]

onready var Spawner = $Spawner

func get_spawn_position():
	var points = Spawner.get_children()
	points.shuffle()
	return points[0].global_position
	

func spawn_asteroid():
	var spawn_position = get_spawn_position()
	Asteroids.shuffle()
	var asteroid = Asteroids[0].instance()
	var main = get_tree().current_scene
	main.add_child(asteroid)
	asteroid.global_position = spawn_position


func _on_Timer_timeout():
	spawn_asteroid()

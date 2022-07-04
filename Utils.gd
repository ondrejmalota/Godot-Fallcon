extends Node


const SideStoneLeft = preload("res://SideStoneLeft.tscn")
const SideStoneRight = preload("res://SideStoneRight.tscn")


func Spawn_Wall_Left():
	var spawnPosition = Vector2(0, -100)
	var sideStoneLeft = SideStoneLeft.instance()
	var main = get_tree().current_scene
	main.add_child(sideStoneLeft)
	sideStoneLeft.global_position = spawnPosition


func Spawn_Wall_Right():
	var spawnPosition = Vector2(168, -100)
	var sideStoneRight = SideStoneRight.instance()
	var main = get_tree().current_scene
	main.add_child(sideStoneRight)
	sideStoneRight.global_position = spawnPosition

func random_move_speed():
	var SPEED
	var random = RandomNumberGenerator.new()
	random.randomize()
	SPEED = random.randi_range(10000, 13000)
	return SPEED


func random_rotate_speed():
	var SPEED
	var random = RandomNumberGenerator.new()
	random.randomize()
	SPEED = random.randi_range(-300, 300)
	return SPEED

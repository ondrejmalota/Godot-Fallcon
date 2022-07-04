extends Node

onready var highScoreLabel = $highScoreLabel

func _ready():
	VisualServer.set_default_clear_color(Color.black)
	set_highscore_label()
	
func _process(delta):
	if Input.is_action_just_pressed("MOVE"):
		get_tree().change_scene("res://Space.tscn")


func set_highscore_label():
	var save_data = SaveAndLoad.load_data_from_file()
	highScoreLabel.text = "Highscore : " + str(save_data.highscore)

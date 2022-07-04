extends Node

onready var ScoreLabel = $ScoreLabel
onready var ScoreDetector = $ScoreDetector/CollisionShape2D
onready var ScoreSound = $ScoreSound

var score = 0

func _ready():
	VisualServer.set_default_clear_color(Color.black)


func Score_Counter():
	ScoreSound.play()
	score += 1
	ScoreLabel.text = str(score)


func _on_ScoreDetector_body_entered(body):
	Score_Counter()


func _on_ShipSprite_shipDestroyed():
	ScoreDetector.disabled = true
	update_score_label()
	yield(get_tree().create_timer(1), "timeout")
	get_tree().change_scene("res://MainMenu.tscn")


func update_score_label():
	var save_data = SaveAndLoad.load_data_from_file()
	if score > save_data.highscore:
		save_data.highscore = score
		SaveAndLoad.save_data_file(save_data)

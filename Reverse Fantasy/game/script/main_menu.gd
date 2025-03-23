extends Control

func _ready():
	# Connect buttons to their functions
	$VBoxContainer/StartButton.pressed.connect(_on_start_pressed)
	$VBoxContainer/QuitButton.pressed.connect(_on_quit_pressed)
	
func _on_start_pressed():
	# Load the game scene (replace 'game.tscn' with your actual scene)
	get_tree().change_scene_to_file("res://scenes/introduction_story.tscn")

func _on_quit_pressed():
	# Quit the game
	get_tree().quit()

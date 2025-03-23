extends Control

@onready var resume_button: Button = $Panel/ResumeButton
@onready var main_menu_button: Button = $Panel/MainMenuButton


func _ready():
	# Connect buttons
	resume_button.pressed.connect(_on_resume_pressed)
	main_menu_button.pressed.connect(_on_main_menu_pressed)
	hide()  # Hide menu at the start

func _on_resume_pressed():
	get_tree().paused = false  # Unpause game
	hide()  # Hide the menu

func _on_main_menu_pressed():
	get_tree().paused = false  # Unpause before changing scene
	get_tree().change_scene_to_file("res://main_menu.tscn")  # Load main menu

func toggle_pause():
	if visible:
		_on_resume_pressed()  # Resume if already open
	else:
		show()
		get_tree().paused = true  # Pause the game

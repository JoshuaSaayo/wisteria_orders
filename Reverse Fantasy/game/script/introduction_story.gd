extends Control

# List of story text
var story = [
	{ "text": "Long ago, the world was ruled by powerful beings...", "bg": "res://assets/BG/prologue_1.jpg" },
	{ "text": "But one day, a great calamity struck the land.", "bg": "res://assets/BG/prologue_1.jpg" },
	{ "text": "Now, only a few remain to tell the tale...", "bg": "res://assets/BG/prologue_2.jpg" },
	{ "text": "Your journey begins here.", "bg": "res://assets/BG/prologue_2.jpg" }
]

var text_index = 0  # Tracks current text position

@onready var story_label: Label = $Panel/StoryLabel
@onready var next_button: Button = $Panel/NextButton
@onready var background: TextureRect = $Background

func _ready():
	update_story()  # Set initial text and background
	next_button.pressed.connect(_on_next_pressed)

func _on_next_pressed():
	text_index += 1
	if text_index < story.size():
		update_story()  # Update text
	else:
		get_tree().change_scene_to_file("res://scenes/game.tscn")  # Load the game scene
		
func update_story():
	story_label.text = story[text_index]["text"]
	background.texture = load(story[text_index]["bg"])

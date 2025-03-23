extends Control

# List of story text
var story = [
	{ "text": "Lorem ipsum dolor sit amet consectetur adipisicing elit. Veritatis sit quibusdam iste reiciendis debitis?", "bg": "res://assets/BG/prologue_1.jpg" },
	{ "text": "Veritatis sit quibusdam iste reiciendis debitis? Quibusdam dolorem perspiciatis", "bg": "res://assets/BG/prologue_1.jpg" },
	{ "text": "repudiandae ipsam dignissimos, libero facilis vel ", "bg": "res://assets/BG/prologue_2.jpg" },
	{ "text": "voluptas quod quidem veniam reiciendis tenetur magni..", "bg": "res://assets/BG/prologue_2.jpg" }
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

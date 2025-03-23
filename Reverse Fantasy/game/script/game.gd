extends Node2D

@onready var pause_menu: Control = $PauseMenu

func _input(event):
	if event.is_action_pressed("ui_cancel"):  # "Esc" key by default
		pause_menu.toggle_pause()

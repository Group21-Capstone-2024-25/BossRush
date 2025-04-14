class_name SettingsMenu
extends Control

@onready var button: Button = $VBoxContainer/NinePatchRect/Button
@onready var controls: TabBar = $VBoxContainer/MarginContainer/TabContainer/Controls
@onready var game: TabBar = $VBoxContainer/MarginContainer/TabContainer/Game
@onready var graphics: TabBar = $VBoxContainer/MarginContainer/TabContainer/Graphics
@onready var audio: TabBar = $VBoxContainer/MarginContainer/TabContainer/Audio

signal exit_option_menu

func _ready() -> void:
	button.button_down.connect(_on_exit_pressed)
	set_process(false)
	
	
func _on_exit_pressed()->void:
	exit_option_menu.emit()
	set_process(false)
	
func _process(_delta):
	var is_fullscreen = DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_FULLSCREEN
	if is_fullscreen:
		controls.custom_minimum_size.y = 750  # or whatever value you need in fullscreen
		game.custom_minimum_size.y = 750 
		graphics.custom_minimum_size.y = 750 
		audio.custom_minimum_size.y = 750 
	else:
		controls.custom_minimum_size.y = 300  # different value for windowed mode
		game.custom_minimum_size.y = 300
		graphics.custom_minimum_size.y = 300
		audio.custom_minimum_size.y = 300
		

extends Control
class_name MenuButtons
@onready var settings_button: Button = $"HBoxContainer/VBoxContainer/NinePatchRect3/settings-button"
@onready var quit_button: Button = $"HBoxContainer/VBoxContainer/NinePatchRect4/quit-button"
@onready var new_game_button: Button = $"HBoxContainer/VBoxContainer/NinePatchRect/new-game-button"


signal settings_pressed
signal new_game_pressed
func _ready() -> void:
	handle_connect_signals()
	
func handle_connect_signals() ->void:
	settings_button.button_down.connect(_on_settings_clicked)
	quit_button.pressed.connect(_on_quit_pressed)
	new_game_button.pressed.connect(_on_new_game_clicked)
	
func _on_settings_clicked() -> void:
	print("settings clicked")
	settings_pressed.emit()  #  Emit signal to parent

func _on_quit_pressed() -> void:
	get_tree().quit()
func _on_new_game_clicked() -> void:
	new_game_pressed.emit()
	

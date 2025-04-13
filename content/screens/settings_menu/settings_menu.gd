class_name SettingsMenu
extends Control

@onready var back_button: Button = $"MarginContainer/VBoxContainer/back-button"

signal exit_option_menu

func _ready() -> void:
	back_button.button_down.connect(_on_exit_pressed)
	set_process(false)
	
func _on_exit_pressed()->void:
	exit_option_menu.emit()
	set_process(false)

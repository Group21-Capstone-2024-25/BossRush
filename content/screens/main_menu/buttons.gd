extends Control
class_name MenuButtons
@onready var settings_button: Button = $"HBoxContainer/VBoxContainer/NinePatchRect3/settings-button"


signal settings_pressed
func _ready() -> void:
	handle_connect_signals()
	
func handle_connect_signals() ->void:
	settings_button.button_down.connect(_on_settings_clicked)
	
func _on_settings_clicked() -> void:
	print("settings clicked")
	settings_pressed.emit()  # 🔥 Emit signal to parent

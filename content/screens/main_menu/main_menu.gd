extends Control

@onready var intro_screen: Control = $IntroScreen
@onready var menu: Control = $Menu
@onready var buttons: MenuButtons = $Menu/VBoxContainer/Buttons
@onready var settings_menu: SettingsMenu = $SettingsMenu



func _ready() -> void:
	if GameManager.init:
		start_intro()
		GameManager.init = false
	
	# Connect signal from settings menu
	buttons.settings_pressed.connect(_on_settings_button_pressed)
	settings_menu.exit_option_menu.connect(_on_settings_exit_pressed)

func _on_settings_exit_pressed() -> void:
	settings_menu.hide()
	menu.show()


func start_intro():
	intro_screen.play()

func show_menu():
	menu.show()

func _on_continue_button_pressed() -> void:
	GameManager.load_game()

func _on_new_game_button_pressed() -> void:
	GameManager.start_game()

func _on_settings_button_pressed() -> void:
	menu.hide()
	settings_menu.set_process(true)
	settings_menu.show()




func _on_intro_screen_finished() -> void:
	intro_screen.hide()
	show_menu()

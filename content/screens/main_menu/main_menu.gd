extends Control

@onready var intro_screen: Control = $IntroScreen
@onready var menu: Control = $Menu

func _ready() -> void:
	if (GameManager.init):
		start_intro()
		GameManager.init = false
	

func start_intro():
	intro_screen.play()

func show_menu():
	menu.show()

func _on_continue_button_pressed() -> void:
	GameManager.load_game()

func _on_new_game_button_pressed() -> void:
	GameManager.start_game()

func _on_settings_button_pressed() -> void:
	UI.open_settings()



func _on_intro_screen_finished() -> void:
	intro_screen.hide()
	show_menu()

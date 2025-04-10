extends Node

const main_menu: = preload("res://content/screens/main_menu/main_menu.tscn")

var init : bool = false

func start_intro() -> void:
	UI.add_child(main_menu.instantiate())
	
func open_main_menu() -> void:
	print("openening main menu")
	

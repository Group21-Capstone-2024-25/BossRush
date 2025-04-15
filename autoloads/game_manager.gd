extends Node

const main_menu: = preload("res://content/screens/main_menu/main_menu.tscn")
const new_game_scene := preload("res://prototype/scenes/new_game_scene.tscn")

var init : bool = false

func start_intro() -> void:
	UI.add_child(main_menu.instantiate())
	
func open_main_menu() -> void:
	print("openening main menu")

func start_game():
	print("game started")
	
	get_tree().change_scene_to_packed(new_game_scene)

extends Node

enum GameState {
	INTRO,
	MENU,
	GAME,
	PAUSED,
	LOADING,
	SAVING
}

enum SaveSlot {
	SLOT1 = 1,
	SLOT2 = 2, 
	SLOT3 = 3,
	AUTOSAVE = 4
}

var current_state: GameState = GameState.INTRO

func open_main_menu() -> void:
	current_state = GameState.MENU

func open_pause_menu() -> void:
	current_state = GameState.PAUSED


func load_saved_game(slot: SaveSlot) -> void:
	pass

func start_new_game() -> void:
	pass


func save_game(slot: SaveSlot) -> void:
	pass

func load_game() -> void:
	pass

func pause_game() -> void:
	open_pause_menu()

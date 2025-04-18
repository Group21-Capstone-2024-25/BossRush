extends PanelContainer

@onready var label: Label = $MarginContainer/VBoxContainer/Label

enum SaveState {
	SAVE,
	LOAD
}

var current_state: SaveState = SaveState.LOAD

func _ready() -> void:
	if    current_state == SaveState.LOAD:
		label.text = "Load"
	elif  current_state == SaveState.SAVE:
		label.text = "Save" 

func _on_slot_1_pressed() -> void:
	pass


func _on_slot_2_pressed() -> void:
	pass


func _on_slot_3_pressed() -> void:
	pass


func _on_autosave_pressed() -> void:
	pass

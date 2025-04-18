extends Control

func _on_video_stream_player_finished() -> void:
	GameManager.open_main_menu()
	queue_free()

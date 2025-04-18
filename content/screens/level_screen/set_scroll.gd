extends ScrollContainer


func _ready() -> void:
	var scrollbar: VScrollBar = get_v_scroll_bar()
	var max_scroll_length: float = scrollbar.max_value
	set_deferred("scroll_vertical",max_scroll_length + size.y)

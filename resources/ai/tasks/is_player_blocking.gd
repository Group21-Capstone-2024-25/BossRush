extends BTAction

func _tick(delta: float) -> Status:
	if agent.check_if_player_is_blocking():
		return SUCCESS
	else:
		return FAILURE

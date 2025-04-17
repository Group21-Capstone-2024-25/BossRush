extends BTCondition

func _tick(_delta: float) -> Status:
	#print("chase working")
	if agent.check_if_player_in_range(10.0, "chase"):
		return SUCCESS
	return FAILURE

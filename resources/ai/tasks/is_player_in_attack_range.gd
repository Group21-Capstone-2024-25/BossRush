extends BTCondition

func _tick(_delta: float) -> Status:
	#print("attack working")
	if agent.check_if_player_in_range(3, "attack"):
		return SUCCESS
	return FAILURE

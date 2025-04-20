extends BTCondition

func _tick(_delta: float) -> Status:
	#print("attack working")
	if agent.player.is_evading:
		return SUCCESS
	return FAILURE

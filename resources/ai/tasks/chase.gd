extends BTAction

func _tick(delta: float) -> Status:
	var distance: float = agent.chase(delta)
	
	if distance >= agent.attack_range:
		return SUCCESS
	
	return RUNNING

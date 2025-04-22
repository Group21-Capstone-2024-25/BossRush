extends BTCondition

func _tick(_delta: float) -> Status:
	var distance: float = (agent.player.position - agent.position).length()
	
	if distance < agent.attack_range:
		return SUCCESS
	return FAILURE

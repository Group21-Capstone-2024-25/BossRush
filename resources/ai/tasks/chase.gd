extends BTAction

func _tick(delta: float) -> Status:
	if agent.player == null:
		return FAILURE

	var player_pos = agent.player.global_transform.origin
	var distance = agent.global_transform.origin.distance_to(player_pos)

	# Move toward player
	agent.chase_player(delta)

	# If close enough to attack, stop chasing
	if distance <= agent.ATTACK_RANGE:
		return SUCCESS  # Let the BT move to attack node

	return RUNNING

extends BTAction

func _tick(delta: float) -> Status:
	if agent.player == null or not is_instance_valid(agent.player):
		return FAILURE

	var player_pos = agent.player.global_transform.origin
	var self_pos = agent.global_transform.origin
	var distance = self_pos.distance_to(player_pos)

	if distance <= agent.ATTACK_RANGE:
		return SUCCESS

	agent.nav_agent.target_position = player_pos
	var move_dir = (agent.nav_agent.get_next_path_position() - self_pos).normalized()


	var current_rot = agent.global_transform.basis.get_rotation_quaternion()
	var target_rot = Transform3D().looking_at(player_pos - self_pos, Vector3.UP).basis.get_rotation_quaternion()
	var new_rot = current_rot.slerp(target_rot, delta * 5.0)
	agent.global_transform.basis = Basis(new_rot)

	agent.velocity = move_dir * agent.SPEED
	agent.move_and_slide()

	if agent.animation_player:
		agent.animation_player.play("minotaur_run_forward")

	return RUNNING

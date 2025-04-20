extends BTAction
var timer := 0.0
const ATTACK_DURATION := 1.0

func _enter():
	timer = 0.0
	agent.play_animation("club_melee_combo_attack_2")

func _tick(delta: float) -> Status:
	timer += delta
	if timer >= ATTACK_DURATION:
		return SUCCESS
	return RUNNING

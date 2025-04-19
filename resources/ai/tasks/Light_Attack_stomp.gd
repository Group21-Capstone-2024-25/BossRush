extends BTAction

var timer := 0.0
const ATTACK_DURATION := 2.7333

func _enter():
	timer = 0.0
	agent.play_animation("minotaur_melee_combo_attack_3")

func _tick(delta: float) -> Status:
	timer += delta
	if timer >= ATTACK_DURATION:
		return SUCCESS
	return RUNNING

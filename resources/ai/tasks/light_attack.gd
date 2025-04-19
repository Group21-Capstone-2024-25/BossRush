extends BTAction

var timer := 0.0
const ATTACK_DURATION := 1.0

func _enter():
	timer = 0.0
	agent.play_animation("minotaur_attack_360_low")

func _tick(delta: float) -> Status:
	timer += delta
	if timer >= ATTACK_DURATION:
		return SUCCESS
	return RUNNING

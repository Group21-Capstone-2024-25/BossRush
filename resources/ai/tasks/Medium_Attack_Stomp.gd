extends BTAction
var timer := 0.0
const ATTACK_DURATION := 4.6667  

func _enter():
	timer = 0.0
	agent.play_animation("club_melee_combo_attack_2")

func _tick(delta: float) -> Status:
	timer += delta
	
	# Optionally: stop early if animation has finished
	# if not agent.animation_player.is_playing():
	#     return SUCCESS

	if timer >= ATTACK_DURATION:
		return SUCCESS

	return RUNNING

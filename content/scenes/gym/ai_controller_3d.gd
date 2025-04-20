extends AIController3D

var move = Vector2.ZERO
@onready var target: Area3D = $"../Target"
@onready var asteriontest_rl: CharacterBody3D = $"../Asteriontest_rl"

func get_obs() -> Dictionary:
	var obs:=[
		asteriontest_rl.position.x,
		asteriontest_rl.position.y,
		target.position.x,
		target.position.y,
		(asteriontest_rl.position-target.position).length()
	]
	return {"obs": obs}

func get_reward() -> float:
	return reward
	
func get_action_space() -> Dictionary:
	return {
		"move" : {
			"size": 2,
			"action_type": "continuous"
		},
	}
	
func set_action(action) -> void:
	move.x = action["move"][0]
	move.y = action["move"][1]

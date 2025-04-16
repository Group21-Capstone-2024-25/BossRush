extends BTAction

var timer: float = 0.0
const FLY_DURATION: float = 2.0
var dir: int

func _enter() -> void:
	dir = [-1,1].pick_random()

func _tick(_delta: float) -> Status:
	#start flying away
	agent.fly_away_scared(_delta, dir)
	
	#increase timer
	timer += _delta
	
	#Return SUCCESS after 2 sec
	if timer >= FLY_DURATION:
		timer = 0.0
		agent.queue_free()
		return SUCCESS
	
	return RUNNING

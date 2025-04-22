extends Actor


@onready var player = get_tree().get_first_node_in_group("Player")

var attack_range: float = 5.0

@export var chase_speed: float = 5.0

var direction: Vector3 = Vector3.UP
var distance: float = 20

func chase(delta: float):
	var move_dir = direction.normalized()
	velocity = move_dir * chase_speed
	
	return distance

func _physics_process(delta: float) -> void:
	direction = player.position - position
	distance = direction.length()
	
	look_at(Vector3(player.position.x, position.y, player.position.z), Vector3.UP, true)
	
	#if distance < attack_range:
		#velocity = velocity.move_toward(Vector3.ZERO, delta)
	
	move_and_slide() 

extends Actor


const SPEED: float = 2.0
const ATTACK_RANGE: float = 2.5
const CHASE_RANGE: float = 10.0

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var bt_player: BTPlayer = $BTPlayer
@onready var player = get_tree().get_nodes_in_group("Player")[0]
@onready var nav_agent: NavigationAgent3D = $NavigationAgent3D

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
	look_at(Vector3(player.global_position.x, global_position.y,player.global_position.x),Vector3.UP)
	move_and_slide()

# Play animation safely (avoids restarting same anim)
func play_animation(anim_name: String):
	if not animation_player.is_playing() or animation_player.current_animation != anim_name:
		animation_player.play(anim_name)

# Move toward target position (used in chase or wander)
func move(target_pos: Vector3, _delta: float):
	var direction = Vector3(
		target_pos.x - global_transform.origin.x, 
		0, 
		target_pos.z - global_transform.origin.z
	).normalized()

	velocity.x = direction.x * SPEED
	velocity.z = direction.z * SPEED

# Used in Chase task
func chase_player(delta: float):
	if player == null:
		return

	var player_pos = player.global_transform.origin
	var direction = (player_pos - global_transform.origin).normalized()
	direction.y = 0  # stay grounded
	velocity.x = direction.x * SPEED
	velocity.z = direction.z * SPEED
	
	

	play_animation("chase")

# Basic range check
func check_if_player_in_range(therange: float, mode: String) -> bool:
	if player == null:
		return false
	
	var distance = global_transform.origin.distance_to(player.global_transform.origin)

	if mode == "attack":
		return distance <= therange  # e.g., 2.5

	if mode == "chase":
		return distance > 2.5 and distance <= therange  # e.g., between 2.5 and 10

	return false

# Called from die task
func die():
	play_animation("die")

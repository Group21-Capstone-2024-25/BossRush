extends CharacterBody3D

const SPEED: float = 1.5 
@onready var sprite_3d: Sprite3D = $Sprite3D
@onready var bt_player: BTPlayer = $BTPlayer
@onready var player = get_tree().get_nodes_in_group("Player")[0]

func move(target_pos: Vector3, _delta: float):
	var direction = Vector3(
		target_pos.x - global_transform.origin.x, 0, 
		target_pos.z - global_transform.origin.z).normalized()
	velocity.x = direction.x * SPEED
	velocity.z = direction.z * SPEED
	
	update_flip(direction.x)

func update_flip(dir: float):
	sprite_3d.flip_h = dir < 0

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	if check_if_player_is_close():
		bt_player.blackboard.set_var("state", "scared")
		bt_player.restart()
	
	move_and_slide()
	
func fly_away_scared(_delta: float, dir: int):
	velocity.y = 5
	velocity.x = dir

func check_if_player_is_close() -> bool:
	
	if player == null:
		return false
	var distance = global_transform.origin.distance_to(player.global_transform.origin)
	return distance < 3
	
	
	

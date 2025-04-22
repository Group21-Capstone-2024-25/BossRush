class_name Player
extends Actor

enum PlayerState {
	MOVE,
	EVADE,
	ATTACK,
	BLOCK,
	ITEM,
	INTERACT
}

@onready var stamina_bar: ProgressBar = $UI/VBoxContainer/StaminaBar
@onready var health_bar: ProgressBar = $UI/VBoxContainer/HealthBar
@onready var camera_mount: Node3D = $CameraMount
@onready var enemy: Actor = get_tree().get_first_node_in_group("Enemy")
@onready var animation_tree: AnimationTree = $AnimationTree

var speed: float = 5.0
var camera_max_angle: float = 1.0
var camera_min_angle: float = 1.0
var current_state: PlayerState = PlayerState.MOVE

@export var horizontal_sensitivity: float = 0.1
@export var vertical_sensitivity: float = 0.1

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		rotate_y(deg_to_rad(-event.relative.x * horizontal_sensitivity))
		camera_mount.rotate_x(deg_to_rad(event.relative.y * vertical_sensitivity))
		camera_mount

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	if Input.is_action_pressed("action_block"):
		is_blocking = true
		animation_tree.set("parameters/conditions/not_blocking", false)
		animation_tree.set("parameters/conditions/is_blocking", true)
		return
	else:
		is_blocking = false
		animation_tree.set("parameters/conditions/is_blocking", false)
		animation_tree.set("parameters/conditions/not_blocking", true)
	
	var input_dir := Input.get_vector("move_left", "move_right", "move_forward", "move_backward")
	animation_tree.set("parameters/movement/blend_position", input_dir)
	
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * speed
		velocity.z = direction.z * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.z = move_toward(velocity.z, 0, speed)

	move_and_slide()

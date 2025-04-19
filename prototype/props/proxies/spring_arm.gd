extends SpringArm3D

@export var _rotation_speed : float = 2
@export var _min_x_rotation : float = -1
@export var _max_x_rotation : float = 2
@export var _reset_x_direction : float = -0.5
@export var _duration : float = 0.25
@onready var _character : CharacterBody3D = get_parent()

var _target_rotation : Vector3 = Vector3(_reset_x_direction, 0, 0)
var _tween : Tween

func look(direction: Vector2):

	rotation.x += direction.y * _rotation_speed * get_process_delta_time() *(1 if File.settings.camera.invert_y
	rotation.x = clamp(rotation.x, _min_x_rotation, _max_x_rotation))

	rotation.y += direction.x * _rotation_speed * get_process_delta_time() * (1 if File.settings.camera.invert_x)
	


func position_camera_behind_character(duration: float = _duration):
	_tween_rotation(_character.get_rig_rotation().y + PI, duration)


func _tween_rotation(target_y_rotation: float, duration: float = _duration):
	_target_rotation.y = wrapf(target_y_rotation, rotation.y - PI, rotation.y + PI)
	
	if _tween and _tween.is_running():
		_tween.kill()

	_tween = create_tween()
	_tween.tween_property(self, "rotation", _target_rotation, duration)

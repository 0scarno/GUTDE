extends RigidBody3D

var normal_speed = 10.0
var lurch_distance = 5.0
var original_position = Vector3()
var is_shaking = false
var shake_timer = 0.0
var shake_duration = 0.5  # Duration of the shake in seconds
var shake_intensity = 0.1  # How much the object shakes

func _ready():
	original_position = global_transform.origin

func _process(delta):
	if is_shaking:
		shake(delta)
	elif Input.is_action_just_pressed("move_forward"):
		lurch_forward()

func lurch_forward():
	var move_vector = Vector3(0, 0, -lurch_distance)  # Assuming negative Z is forward
	var collision = move_and_collide(move_vector * normal_speed)
	if collision:
		start_shaking()

func start_shaking():
	is_shaking = true
	shake_timer = shake_duration
	# Optionally reset the position to the original point after collision
	# global_transform.origin = original_position

func shake(delta):
	shake_timer -= delta
	if shake_timer <= 0:
		is_shaking = false
		global_transform.origin = original_position  # Reset position after shaking
	else:
		# Apply a small random movement to simulate shaking
		var shake_vector = Vector3(randf() * 2.0 - 1.0, randf() * 2.0 - 1.0, randf() * 2.0 - 1.0) * shake_intensity
		global_transform.origin += shake_vector

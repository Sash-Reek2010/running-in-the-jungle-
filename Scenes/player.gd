extends CharacterBody2D


const SPEED = 200.0
const JUMP_VELOCITY = -350.0

func _input(event: InputEvent) -> void:
	if event is InputEventKey and event.pressed:
		if event.keycode == KEY_Q:
			scale = Vector2(0.5, 0.5)
			
			
func _physics_process(delta: float) -> void:
	print(position)
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	if position.x > 1684 and position.x < 1774 and position.y > 250: 
		print ("YAY")
		get_tree().change_scene_to_file("res://Scenes/control.tscn")
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

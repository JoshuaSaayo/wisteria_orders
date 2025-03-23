extends CharacterBody2D

const SPEED = 60
const GRAVITY = 500  # Adjust as needed
const MAX_FALL_SPEED = 300  # Limit fall speed

var direction = -1

@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var ray_cast_left: RayCast2D = $RayCastLeft
@onready var ray_cast_down: RayCast2D = $RayCastDown
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
		# Apply gravity
	velocity.y += GRAVITY * delta
	velocity.y = min(velocity.y, MAX_FALL_SPEED)  # Limit fall speed
	# Check if the slime is on the ground before moving
	if ray_cast_down.is_colliding():
		if ray_cast_right.is_colliding():
			direction = -1
			animated_sprite.flip_h = true
		if ray_cast_left.is_colliding():
			direction = 1
			animated_sprite.flip_h = false
		position.x += direction * SPEED * delta
	else:
		# Stop horizontal movement when falling
		velocity.x = 0

	# Apply movement
	move_and_slide()

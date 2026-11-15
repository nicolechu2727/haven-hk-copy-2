class_name Dough
extends CharacterBody2D
@onready var animated=$AnimatedSprite2D

const SPEED = 300.0
const JUMP_VELOCITY = -600.0

var savetime=0
var bouncing=false
func bounce()->void:
	bouncing=true
	animated.position.y-=40
	await get_tree().create_timer(0.2).timeout
	animated.position.y+=40
	await get_tree().create_timer(0.2).timeout
	bouncing=false
	
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	#else:
		#animated.play(0)
	#if velocity.y<0:
		#set_collision_mask_value(0,false)
	#else:
		#set_collision_mask_value(0,true)
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	
	if velocity.length()>0:
		animated.play("idle")
	else:
		#print("hello")
		animated.stop()
		if not bouncing:
			bounce()


	
	if direction:
		velocity.x = direction * SPEED
		
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if velocity.x<0:
		animated.flip_h=true
	elif velocity.x>0:
		animated.flip_h=false

	move_and_slide()

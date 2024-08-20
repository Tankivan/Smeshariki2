extends KinematicBody2D

var motion = Vector2()

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func _physics_process(delta):
	if Input.is_action_pressed("ui_down"):
		motion.y = 200
	elif Input.is_action_just_released("ui_down"):
		$AnimatedSprite.play("idle_down")
		motion.y = 0
	if Input.is_action_pressed("ui_up"):
		motion.y = -200
	elif Input.is_action_just_released("ui_up"):
		$AnimatedSprite.play("idle_up")
		motion.y = 0
	if Input.is_action_pressed("ui_right"):
		motion.x = 200
	elif Input.is_action_just_released("ui_right"):
		$AnimatedSprite.play("idle_right")
		motion.x = 0
	if Input.is_action_pressed("ui_left"):
		motion.x = -200
	elif Input.is_action_just_released("ui_left"):
		$AnimatedSprite.play("idle_left")
		motion.x = 0
	if motion.x > 0:
		$AnimatedSprite.play("right")
	elif motion.x < 0:
		$AnimatedSprite.play("left")
	elif motion.y < 0:
		$AnimatedSprite.play("up")
	elif motion.y > 0:
		$AnimatedSprite.play("down")
	motion = move_and_slide(motion)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_krosh_body_entered(body):
	pass # Replace with function body.

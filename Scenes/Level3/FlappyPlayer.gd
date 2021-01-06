extends KinematicBody2D

const ACCELERATION = 500
const MAX_SPEED = 100
const ROLL_SPEED = 110
const FRICTION = 500

var velocity = Vector2.ZERO
var roll_vector = Vector2.DOWN
var position_x
var playing = true
var vector_x = 0.7

func _ready():
	loopthing()

func _physics_process(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = vector_x
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	#input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		roll_vector = input_vector
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION *delta)
		
	if Input.is_action_just_pressed("debug"):
		pass
		
	move()
	
func loopthing():
	while playing:
		position_x = self.position.x
		yield(get_tree().create_timer(0.5),"timeout")
		if position_x == self.position.x:
			get_tree().reload_current_scene()
	
	
func move():
	velocity = move_and_slide(velocity)



func _on_Area2D_body_entered(body):
	vector_x += 0.3


func _on_Area2D2_body_entered(body):
	vector_x += 0.4


func _on_Area2D3_body_entered(body):
	vector_x += 0.3


func _on_Area2D4_body_entered(body):
	vector_x -= 0.2


func _on_Area2D4_body_exited(body):
	vector_x -= 0.2

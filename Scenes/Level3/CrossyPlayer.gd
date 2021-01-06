extends KinematicBody2D

const ACCELERATION = 500
const MAX_SPEED = 100
const ROLL_SPEED = 110
const FRICTION = 500

var velocity = Vector2.ZERO
var roll_vector = Vector2.DOWN
var jump = false
var jump_distance = 40
var can_jump = false
var can_jump2 = true
var log_on
var on_log = false
var can_log = true
var final_jump = false

func _ready():
	pass
	
func _physics_process(delta):
	if on_log == true and jump == false and can_log == true:
		position = log_on.position

func _input(event):
	if Input.is_action_just_pressed("ui_up") and can_jump2 == true:
		$AnimationPlayer.play("roll")
		$AudioStreamPlayer.play()
		jump = true
		jump_distance = 0
		can_jump2 = false
		while jump == true:
			yield(get_tree().create_timer(0.03),"timeout")
			position.y -= 5
			jump_distance += 5
			if jump_distance >= 40:
				jump = false
				can_jump2 = true
				if !on_log and !final_jump:
					can_log = false
					MusicPlayer.splash()
					get_tree().reload_current_scene()

func _on_Area2D_area_entered(area):
	can_jump = true

func _on_Area2D_area_exited(area):
	can_jump = false

func _on_Area2D_body_entered(body):
	if body.name == "Player":
		final_jump = true
		print("player body on da log")

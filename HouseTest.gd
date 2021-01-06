extends Node2D
var can_leave

func _ready():
	GlobalVariables.in_house = true

func _on_Area2D_body_entered(body):
	if body.name == "Player":
		can_leave = true

func _on_Area2D_body_exited(body):
	if body.name == "Player":
		can_leave = false

func _input(event):
	if event is InputEventKey and Input.is_action_just_pressed("interact") and can_leave == true:
		SceneChanger.changescene("res://World.tscn")
		print("Leaving house...")

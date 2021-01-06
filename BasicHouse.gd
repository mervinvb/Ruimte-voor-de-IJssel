extends Area2D
var in_body
onready var player = get_tree().root.get_node("World/YSort/Player")

func _on_Area2D_body_entered(body):
	if body.name == "Player":
		in_body = true
		$AnimationPlayer.play("Invitation")

func _on_Area2D_body_exited(body):
	if body.name == "Player":
		in_body = false
		$AnimationPlayer.play_backwards("Invitation")

func _input(event):
	if event is InputEventKey and Input.is_action_just_pressed("interact") and in_body == true:
		SceneChanger.changescene(1)
		GlobalVariables.position_y = player.position.y
		GlobalVariables.position_x = player.position.x
		SceneChanger.changescene("res://HouseTest.tscn")
		print("Entering house...")

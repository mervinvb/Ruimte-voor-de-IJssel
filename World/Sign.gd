extends Area2D

export var sign_id = 0
export var hotfix = false
onready var signHandler = get_tree().root.get_node("World/YSort/Signs")


func _on_Sign_body_entered(body):
	if body.name == "Player":
		print("Player entered sign with code " + str(sign_id) + ".")
		signHandler.in_body = 1
		signHandler.current_sign = sign_id
		$AnimationPlayer.play("SignShow")

func _on_Sign_body_exited(body):
	if body.name == "Player":
		print("Player left sign area!")
		signHandler.in_body = 0
		$AnimationPlayer.play("SignHide")

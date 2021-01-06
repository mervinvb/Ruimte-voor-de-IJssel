extends CanvasLayer
var pauzed = false

func changescene(scene):
	$AnimationPlayer.play("Switch")
	GlobalVariables.switch = scene
	
func scenechange():
	get_tree().change_scene(GlobalVariables.switch)

func _input(event):
	if Input.is_action_just_pressed("ui_cancel"):
		("pauzing game")
		if !pauzed:
			get_tree().paused = true
			$ColorRect2.show()
			$AnimationPlayer.play("pauze")
			pauzed = true
		else:
			$AnimationPlayer.play_backwards("pauze")
			get_tree().paused = false
			yield(get_tree().create_timer(0.5),"timeout")
			pauzed = false
			$ColorRect2.hide()
			

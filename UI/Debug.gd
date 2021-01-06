extends Control


func _input(event):
	if Input.is_action_pressed("debug1") and Input.is_action_pressed("debug2") and Input.is_action_pressed("debug3"):
		get_tree().paused = true
		show_all()


func _on_Button_pressed():
	SceneChanger.changescene("res://Scenes/Level1/Level1.tscn")
	#get_tree().change_scene("res://Scenes/Level1/Level1.tscn")
	get_tree().paused = false
	hide_all()

func _on_Button2_pressed():
	SceneChanger.changescene("res://Scenes/Level2/Level2.tscn")
	#get_tree().change_scene("res://Scenes/Level2/Level2.tscn")
	get_tree().paused = false
	hide_all()

func hide_all():
	$CanvasLayer/Button.hide()
	$CanvasLayer/Button2.hide()
	$CanvasLayer/Button3.hide()
	$CanvasLayer/Button4.hide()
	$CanvasLayer/Button5.hide()
	$CanvasLayer/ColorRect.hide()
	$CanvasLayer/Label.hide()
	$CanvasLayer/Label2.hide()
	$CanvasLayer/Label3.hide()
	
func show_all():
	$CanvasLayer/Button.show()
	$CanvasLayer/Button2.show()
	$CanvasLayer/Button3.show()
	$CanvasLayer/Button4.show()
	$CanvasLayer/Button5.show()
	$CanvasLayer/ColorRect.show()
	$CanvasLayer/Label.show()
	$CanvasLayer/Label2.show()
	$CanvasLayer/Label3.show()


func _on_Button3_pressed():
	SceneChanger.changescene("res://World.tscn")
	get_tree().paused = false
	hide_all()

func _on_Button4_pressed():
	SceneChanger.changescene("res://Scenes/Bossfight/Bossfight.tscn")
	get_tree().paused = false
	hide_all()

func _on_Button5_pressed():
	SceneChanger.changescene("res://Scenes/Bossfight/EndScore.tscn")
	get_tree().paused = false
	hide_all()

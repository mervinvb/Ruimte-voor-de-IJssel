extends CanvasLayer

func _ready():
	$ColorRect.hide()
	$ColorRect2.hide()
	$Label.hide()

func perform():
	$ColorRect.show()
	$ColorRect2.show()
	$AnimationPlayer.play("cut")
	$AudioStreamPlayer.play()
	$Label.show()
	
func switch():
	SceneChanger.changescene("res://Scenes/Level2/Level2.tscn")

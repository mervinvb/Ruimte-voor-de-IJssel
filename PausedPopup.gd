extends Popup
var paused = false
onready var music = get_tree().root.get_node("World/Birds")

func pause():
	get_tree().paused = true
	$AnimationPlayer.play("Pause")
	
func resume():
	get_tree().paused = false
	$AnimationPlayer.play_backwards("Pause")

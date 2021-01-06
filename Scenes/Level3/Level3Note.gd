extends Sprite

export var scene_change = "res://World.tscn"

func _on_Area2D_body_entered(body):
	if body.name == "Player":
		GlobalVariables.total_notes += 1
		NoteHandler.update_stuff()
		$AudioStreamPlayer.play()
		GlobalVariables.stored_position = true
		SceneChanger.changescene(scene_change)

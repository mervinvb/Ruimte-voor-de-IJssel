extends Sprite

export var self_note = 0



func _on_Button_mouse_entered():
	$AnimationPlayer.play("bright")


func _on_Button_mouse_exited():
	$AnimationPlayer.play_backwards("bright")


func _on_Button_pressed():
	NoteHandler.show_note(self_note)

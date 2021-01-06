extends AnimationPlayer



func _on_Answer1_mouse_entered():
	play("1")


func _on_Answer1_mouse_exited():
	play_backwards("1")


func _on_Answer2_mouse_entered():
	$AnimationPlayer.play("2")


func _on_Answer2_mouse_exited():
	$AnimationPlayer.play_backwards("2")


func _on_Answer3_mouse_entered():
	$AnimationPlayer2.play("3")


func _on_Answer3_mouse_exited():
	$AnimationPlayer2.play_backwards("3")

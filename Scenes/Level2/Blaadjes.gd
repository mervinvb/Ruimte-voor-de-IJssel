extends Node2D

onready var camera = get_tree().root.get_node("World/Camera2D")

func water():
	camera.current = false
	$Camera2D2.current = true
	$note/AnimationPlayer.play("water")
	yield(get_tree().create_timer(0.3),"timeout")
	$note2/AnimationPlayer.play("water")
	yield(get_tree().create_timer(0.1),"timeout")
	$note3/AnimationPlayer.play("water")
	yield(get_tree().create_timer(3.5),"timeout")
	camera.current = true
	$Camera2D2.current = false

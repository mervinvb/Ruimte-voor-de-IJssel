extends Node2D
var raw_score
var anim1
var anim2
var anim3
var anim4
var anim5
var correct
var time
var multiplier = 10000

func _ready():
	MusicPlayer.fade_all_out()
	correct = float(GlobalVariables.correct_questions)
	time = float(GlobalVariables.time)
	print(correct)
	print(time)
	raw_score = correct / time * multiplier
	print(raw_score)
	anim1 = int(raw_score / 5)
	anim2 = int(raw_score / 4)
	anim3 = int(raw_score / 3)
	anim4 = int(raw_score / 2)
	anim5 = int(raw_score)
	$AnimationPlayer.play("show")
	yield(get_tree().create_timer(0.9),"timeout")
	$Label.text = str(anim1)
	yield(get_tree().create_timer(0.6),"timeout")
	$Label.text = str(anim2)
	yield(get_tree().create_timer(0.8),"timeout")
	$Label.text = str(anim3)
	yield(get_tree().create_timer(1),"timeout")
	$Label.text = str(anim4)
	yield(get_tree().create_timer(1.5),"timeout")
	$AnimationPlayer.play("yey")
	$Label.text = str(anim5)
	yield(get_tree().create_timer(1),"timeout")
	MusicPlayer.endcredit()

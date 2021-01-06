extends Node2D

func _ready():
	$MenuTheme.play()
	
func splash():
	$Splash.play()
	
func fade_out():
	$Timer.start()
	$AnimationPlayer.play("fade_out")

func bossfight():
	$MenuTheme.stop()
	$OverworldTheme.stop()
	$Bossfight.play()
	
func fade_all_out():
	$AnimationPlayer.play("fade_boss")
	$MenuTheme.stop()
	$OverworldTheme.stop()

func endcredit():
	$AnimationPlayer.play("start")
	yield(get_tree().create_timer(0.1),"timeout")
	$MenuTheme.play()

func _on_Timer_timeout():
	GlobalVariables.time += 1

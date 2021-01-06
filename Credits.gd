extends Node2D

var _timer = null

func _ready():
	$AnimationPlayer.play("walk")
	_timer = Timer.new()
	add_child(_timer)

	_timer.connect("timeout", self, "_on_Timer_timeout")
	_timer.set_wait_time(9)
	_timer.set_one_shot(false) # Make sure it loops
	_timer.start()
	
func _on_Timer_timeout():
	$AnimationPlayer2.play("move")

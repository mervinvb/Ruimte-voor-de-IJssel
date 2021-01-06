extends CanvasLayer

func _ready():
	if GlobalVariables.total_notes == 10:
		$AnimationPlayer.play("2")
	else:
		if GlobalVariables.total_notes > 7:
			$AnimationPlayer.play("1")

func doel():
	$AnimationPlayer.play("1")

extends Node2D

func _ready():
	$AnimationPlayer2.play("fadein")
	yield(get_tree().create_timer(3),"timeout")
	opening()
	
func _input(event):
	if Input.is_action_just_pressed("ui_accept"):
		SceneChanger.changescene("res://Scenes/Level1/Level1.tscn")

func opening():
	$Label.text = "..."
	$AnimationPlayer.play("Showtext")
	yield(get_tree().create_timer(2),"timeout")
	$AnimationPlayer.play("Hidetext")
	yield(get_tree().create_timer(2),"timeout")

	$Label.text = "Waar is mijn telefoon?"
	$AnimationPlayer.play("Showtext")
	yield(get_tree().create_timer(2),"timeout")
	$AnimationPlayer.play("Hidetext")
	yield(get_tree().create_timer(2),"timeout")
	
	$Label.text = "Ik heb hem in de bus laten liggen."
	$AnimationPlayer.play("Showtext")
	yield(get_tree().create_timer(2),"timeout")
	$AnimationPlayer.play("Hidetext")
	yield(get_tree().create_timer(2),"timeout")
	
	$Label.text = "'Ik ben zo terug!'"
	$AnimationPlayer.play("Showtext")
	yield(get_tree().create_timer(2),"timeout")
	$AnimationPlayer.play("Hidetext")
	yield(get_tree().create_timer(2),"timeout")
	
	$Footsteps.play()
	yield(get_tree().create_timer(3),"timeout")
	
	$Label.text = "Ah, hij was onder mijn stoel gevallen."
	$AnimationPlayer.play("Showtext")
	yield(get_tree().create_timer(2),"timeout")
	$AnimationPlayer.play("Hidetext")
	yield(get_tree().create_timer(2),"timeout")
	
	$Leeg.play()
	yield(get_tree().create_timer(2),"timeout")
	
	$Label.text = "Verrek, hij is leeg!"
	$AnimationPlayer.play("Showtext")
	yield(get_tree().create_timer(2),"timeout")
	$AnimationPlayer.play("Hidetext")
	yield(get_tree().create_timer(2),"timeout")
	
	$Label.text = "Laat ik maar snel de groep vinden."
	$AnimationPlayer.play("Showtext")
	yield(get_tree().create_timer(4),"timeout")
	
	$AnimationPlayer.play("White")
	$AnimationPlayer2.play("fadeout")
	yield(get_tree().create_timer(2),"timeout")
	SceneChanger.changescene("res://Scenes/Level1/Level1.tscn")
	
func show_text(text, time):
	$Label.text = text
	$AnimationPlayer.play("Showtext")
	yield(get_tree().create_timer(time),"timeout")
	$AnimationPlayer.play("Hidetext")

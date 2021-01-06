extends Sprite

export var node_id = 0
var in_notes = false
export var is_notes = false

onready var doel = get_tree().root.get_node("World/Doel/AnimationPlayer")
onready var aart = get_tree().root.get_node("World/Ysort/AartLevel1")
onready var aart2 = get_tree().root.get_node("World/Ysort/AartLevel1_2")
var left = 4
var playing = false
# Called when the node enters the scene tree for the first time.
func _ready():
	if is_notes:
		$Area2D.queue_free()
		


func collect():
	playing = true
	
	GlobalVariables.total_notes += 1
	
	NoteHandler.show_handler()
	NoteHandler.update_stuff()
	
	$AudioStreamPlayer.play()
	
	if GlobalVariables.level_1_blaadjes_left == 4:
		print("collected 4")
		GlobalVariables.level_1_blaadjes_left -= 1
		left -= 1
		$CanvasLayer/notefortext.show()
		$CanvasLayer/Note1.show()
		$CanvasLayer/Hider.show()
		$AnimationPlayer2.play("showall")
		print("done")
		in_notes = false
		
	elif GlobalVariables.level_1_blaadjes_left == 3:
		GlobalVariables.level_1_blaadjes_left -= 1
		left -= 1
		print("collected 3")
		$CanvasLayer/notefortext.show()
		$CanvasLayer/Note2.show()
		$CanvasLayer/Hider.show()
		$AnimationPlayer2.play("showall")
		in_notes = false
		
	elif GlobalVariables.level_1_blaadjes_left == 2:
		GlobalVariables.level_1_blaadjes_left -= 1
		left -= 1
		$CanvasLayer/notefortext.show()
		$CanvasLayer/Note3.show()
		$CanvasLayer/Hider.show()
		$AnimationPlayer2.play("showall")
		in_notes = false
		
	elif GlobalVariables.level_1_blaadjes_left == 1:
		GlobalVariables.level_1_blaadjes_left -= 1
		left -= 1
		$CanvasLayer/notefortext.show()
		$CanvasLayer/Note4.show()
		$CanvasLayer/Hider.show()
		$AnimationPlayer2.play("showall")
		in_notes = false
		
func show_1():
		$CanvasLayer/notefortext.show()
		$CanvasLayer/Note2.hide()
		$CanvasLayer/Note3.hide()
		$CanvasLayer/Note4.hide()
		$CanvasLayer/Note1.show()
		$CanvasLayer/Hider.show()
		$AnimationPlayer2.play("showall")
		in_notes = true

func show_2():
		$CanvasLayer/notefortext.show()
		$CanvasLayer/Note1.hide()
		$CanvasLayer/Note3.hide()
		$CanvasLayer/Note4.hide()
		$CanvasLayer/Note2.show()
		$CanvasLayer/Hider.show()
		$AnimationPlayer2.play("showall")
		in_notes = true

func show_3():
		$CanvasLayer/Note2.hide()
		$CanvasLayer/Note1.hide()
		$CanvasLayer/Note4.hide()
		$CanvasLayer/notefortext.show()
		$CanvasLayer/Note3.show()
		$CanvasLayer/Hider.show()
		$AnimationPlayer2.play("showall")
		in_notes = true
		
func show_4():
		$CanvasLayer/Note2.hide()
		$CanvasLayer/Note3.hide()
		$CanvasLayer/Note1.hide()
		$CanvasLayer/notefortext.show()
		$CanvasLayer/Note4.show()
		$CanvasLayer/Hider.show()
		$AnimationPlayer2.play("showall")
		in_notes = true
		
func _on_Area2D_body_entered(body):
	if body.name == 'Player' and playing == false:
		collect()
		
func hide_all():
	$CanvasLayer/notefortext.hide()
	$CanvasLayer/Note1.hide()
	$CanvasLayer/Note2.hide()
	$CanvasLayer/Note3.hide()
	$CanvasLayer/Note4.hide()
	$CanvasLayer/Hider.hide()
	if in_notes == false:
		if GlobalVariables.level_1_blaadjes_left == 0:
			doel.play("newdoel")
			aart.queue_free()
			aart2.show()

func _on_Button_pressed():
	$AnimationPlayer2.play_backwards("showall")
	$AnimationPlayer3.play("hidenote")
	yield(get_tree().create_timer(0.5),"timeout")
	hide_all()
	playing = false
	if in_notes == false:
		self.queue_free()

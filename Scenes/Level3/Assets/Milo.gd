extends Sprite

var in_body
onready var dialoguePopup = get_tree().root.get_node("World/CanvasLayer/DialoguePopup")

onready var Player = get_tree().root.get_node("World/YSort/Player")

func _ready():
	pass # Replace with function body.

func _input(event):
	if Input.is_action_just_pressed("interact") and in_body == true:
		print("going to talk")
		talk()

func talk(answer = ""):
	match GlobalVariables.milo_state:
		1:
			dialoguePopup.npc = self
			dialoguePopup.npc_name = "Jij"
			dialoguePopup.dialogue = "Hoi! Heb jij hier ergens in de buurt een notitie gezien?"
			dialoguePopup.answers = "[R]"
			dialoguePopup.open()
			GlobalVariables.milo_state += 1
		2:
			dialoguePopup.npc = self
			dialoguePopup.npc_name = "Milo"
			dialoguePopup.dialogue = "Jazeker! Ik zag hem naar de overkant van de IJssel waaien!"
			dialoguePopup.answers = "[R]"
			dialoguePopup.open()
			GlobalVariables.milo_state += 1
		3:
			dialoguePopup.npc = self
			dialoguePopup.npc_name = "Jij"
			dialoguePopup.dialogue = "Weet je hoe ik daar kan komen?"
			dialoguePopup.answers = "[R]"
			dialoguePopup.open()
			GlobalVariables.milo_state += 1
		4:
			dialoguePopup.npc = self
			dialoguePopup.npc_name = "Milo"
			dialoguePopup.dialogue = "Als ik jou was zou ik over die boomstammen heen springen."
			dialoguePopup.answers = "[R]"
			dialoguePopup.open()
			GlobalVariables.milo_state += 1
		5:
			dialoguePopup.npc = self
			dialoguePopup.npc_name = "Milo"
			dialoguePopup.dialogue = "Maar let op je timing, je moet niet in het water vallen!"
			dialoguePopup.answers = "[R]"
			dialoguePopup.open()
			GlobalVariables.milo_state += 1
		6:
			dialoguePopup.close()
			GlobalVariables.position_x = Player.position.x
			GlobalVariables.position_y = Player.position.y
			SceneChanger.changescene("res://Scenes/Level3/CrossyRoad.tscn")
			GlobalVariables.milo_state += 1
		7:
			dialoguePopup.npc = self
			dialoguePopup.npc_name = "Milo"
			dialoguePopup.dialogue = "Wauw! Het is je gelukt!"
			dialoguePopup.answers = "[R]"
			dialoguePopup.open()
			GlobalVariables.milo_state += 1
		8:
			dialoguePopup.close()
			GlobalVariables.milo_state = 7
			
func note_made():
	pass
	
func _on_Area2D_body_entered(body):
	if body.name == 'Player':
		$AnimationPlayer2.play("show_text")
		in_body = true


func _on_Area2D_body_exited(body):
	if body.name == 'Player':
		$AnimationPlayer2.play_backwards("show_text")
		in_body = false
